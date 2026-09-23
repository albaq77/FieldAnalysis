// Authored source, not generated. Logical-object instrumentation before LLVM optimization.
#include "llvm/Support/JSON.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"

static cl::opt<std::string> LogicalConfig("fa-logical-config", cl::init(""),
    cl::desc("JSON target-object and function selection for logical-trace"));

static void logicalFail(const Twine &Message) {
  report_fatal_error(Twine("logical-trace: ") + Message);
}

static std::string logicalJSON(const json::Value &Value) {
  std::string S;
  raw_string_ostream OS(S);
  OS << Value;
  return S;
}

static json::Object logicalDescriptor(const json::Object &Spec, Type *Ty,
                                      const DataLayout &DL) {
  json::Object D = Spec;
  if (!D.getString("name")) logicalFail("every object needs a name");
  json::Array Dimensions;
  while (auto *A = dyn_cast_or_null<ArrayType>(Ty)) {
    Dimensions.push_back((int64_t)A->getNumElements());
    Ty = A->getElementType();
  }
  if (Ty && (!Ty->isSized() || Ty->isScalableTy())) logicalFail("unsized/scalable target type");
  if (Ty) {
    uint64_t Size = DL.getTypeAllocSize(Ty).getFixedValue();
    if (auto UserSize = D.getInteger("element_size"))
      if (*UserSize != (int64_t)Size) logicalFail("element_size disagrees with IR type");
    D["element_size"] = (int64_t)Size;
    if (auto *S = dyn_cast<StructType>(Ty)) {
      json::Array Fields;
      auto *Names = D.getArray("field_names");
      if (Names && Names->size() != S->getNumElements()) logicalFail("field_names length disagrees with struct");
      const StructLayout *Layout = DL.getStructLayout(S);
      for (unsigned I = 0; I < S->getNumElements(); ++I) {
        std::string Name = "f" + std::to_string(I);
        if (Names) {
          auto N = (*Names)[I].getAsString();
          if (!N) logicalFail("field_names must contain strings");
          Name = N->str();
        }
        Fields.push_back(json::Object{{"name", Name},
          {"offset", (int64_t)Layout->getElementOffset(I)},
          {"size", (int64_t)DL.getTypeStoreSize(S->getElementType(I)).getFixedValue()}});
      }
      D["fields"] = std::move(Fields);
    }
  }
  auto E = D.getInteger("element_size");
  if (!E || *E <= 0) logicalFail("supply type or positive element_size for heap objects");
  if (!D.getArray("shape") && !Dimensions.empty()) D["shape"] = std::move(Dimensions);
  if (auto *Shape = D.getArray("shape"))
    for (const auto &V : *Shape)
      if (!V.getAsInteger() || *V.getAsInteger() <= 0) logicalFail("shape dimensions must be positive");
  if (auto *Strides = D.getArray("strides")) {
    auto *Shape = D.getArray("shape");
    if (!Shape || Shape->size() != Strides->size()) logicalFail("strides require matching shape");
    for (const auto &V : *Strides)
      if (!V.getAsInteger() || *V.getAsInteger() <= 0) logicalFail("strides must be positive bytes");
  }
  return D;
}

struct LogicalTracePass : PassInfoMixin<LogicalTracePass> {
  static bool isRequired() { return true; }
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    if (M.getNamedMetadata("fieldanalysis.logical.instrumented")) return PreservedAnalyses::all();
    if (LogicalConfig.empty()) logicalFail("-fa-logical-config is required");
    auto Buffer = MemoryBuffer::getFile(LogicalConfig);
    if (!Buffer) logicalFail("cannot read configuration");
    auto Parsed = json::parse((*Buffer)->getBuffer());
    if (!Parsed) logicalFail(toString(Parsed.takeError()));
    auto *Config = Parsed->getAsObject();
    if (!Config) logicalFail("configuration must be an object");
    auto *Specs = Config->getArray("objects");
    if (!Specs || Specs->empty()) logicalFail("objects selection must not be empty");
    std::set<std::string> Functions;
    if (Config->get("functions") && !Config->getArray("functions"))
      logicalFail("functions must be an array; omit it or use [] for all functions");
    if (auto *Names = Config->getArray("functions"))
      for (const auto &Name : *Names) {
        auto S = Name.getAsString();
        auto *F = S ? M.getFunction(*S) : nullptr;
        if (!F || !isTraceableFunction(*F)) logicalFail("unknown or excluded function in selection");
        Functions.insert(S->str());
      }
    LLVMContext &C = M.getContext();
    const DataLayout &DL = M.getDataLayout();
    if (DL.getPointerSizeInBits(0) != 64) logicalFail("only 64-bit CPU pointers supported");
    uint64_t ModuleID = moduleIdentity(M);
    Type *I64 = Type::getInt64Ty(C), *I32 = Type::getInt32Ty(C);
    Type *PtrTy = PointerType::getUnqual(C), *Void = Type::getVoidTy(C);
    struct Target { Value *Ptr; Instruction *After; Value *Size; std::string JSON; Function *StackFunction; };
    std::vector<Target> Targets;
    std::vector<CallInst *> Releases, Reallocs;
    std::vector<MemoryPoint> Points;
    json::Array SiteInfo, TargetInfo;
    uint64_t Unsupported = 0;
    std::vector<Instruction *> Original;
    for (Function &F : M) if (isTraceableFunction(F))
      for (BasicBlock &BB : F) for (Instruction &I : BB) {
        if (I.getMetadata("fieldanalysis.v2")) logicalFail("use original IR, not v2-instrumented IR");
        Original.push_back(&I);
        if (auto *Call = dyn_cast<CallInst>(&I)) if (auto *CF = Call->getCalledFunction()) {
          StringRef Name = CF->getName();
          if (Name == "free" || Name == "munmap" || Name == "_ZdlPv" || Name == "_ZdaPv" ||
              Name == "_ZdlPvm" || Name == "_ZdaPvm") Releases.push_back(Call);
          if (Name == "realloc") Reallocs.push_back(Call);
        }
      }
    for (const auto &V : *Specs) {
      const auto *Spec = V.getAsObject();
      if (!Spec) logicalFail("object selector must be an object");
      std::string Kind = Spec->getString("kind").value_or("").str();
      Type *Ty = nullptr;
      if (auto T = Spec->getString("type")) {
        if (*T == "i8") Ty = Type::getInt8Ty(C);
        else if (*T == "i32") Ty = I32;
        else if (*T == "i64") Ty = I64;
        else if (*T == "float") Ty = Type::getFloatTy(C);
        else if (*T == "double") Ty = Type::getDoubleTy(C);
        else Ty = StructType::getTypeByName(C, *T);
        if (!Ty) logicalFail(Twine("unknown target type ") + *T);
      }
      Value *Base = nullptr, *Size = nullptr;
      Instruction *After = nullptr;
      Function *StackFunction = nullptr;
      if (Kind == "global") {
        auto Symbol = Spec->getString("symbol");
        auto *G = Symbol ? M.getNamedGlobal(*Symbol) : nullptr;
        if (!G || G->isDeclaration() || G->isThreadLocal()) logicalFail("global target missing, external, or TLS");
        Ty = G->getValueType();
        if (!Ty->isSized() || Ty->isScalableTy()) logicalFail("unsupported global type");
        Base = G; Size = ConstantInt::get(I64, DL.getTypeAllocSize(Ty).getFixedValue());
      } else if (Kind == "stack") {
        auto FN = Spec->getString("function"), AN = Spec->getString("alloca");
        Function *F = FN ? M.getFunction(*FN) : nullptr;
        if (!F || !isTraceableFunction(*F) || !AN) logicalFail("stack selector needs defined function/alloca");
        for (Instruction &I : F->getEntryBlock()) if (auto *A = dyn_cast<AllocaInst>(&I))
          if (A->getName() == *AN) {
            Base = A; After = A; Ty = A->getAllocatedType(); StackFunction = F;
            IRBuilder<> B(A->getNextNode());
            if (!Ty->isSized() || Ty->isScalableTy()) logicalFail("unsupported stack type");
            Size = B.CreateMul(B.CreateZExtOrTrunc(A->getArraySize(), I64),
                               B.getInt64(DL.getTypeAllocSize(Ty).getFixedValue()));
          }
        if (!Base) logicalFail("stack selector requires a named entry-block alloca");
        for (Instruction *I : Original) if (I->getFunction() == F)
          if (isa<ResumeInst>(I) || isa<CleanupReturnInst>(I)) logicalFail("selected stack object requires normal-return function");
      } else if (Kind == "heap") {
        auto FN = Spec->getString("function"), Callee = Spec->getString("callee");
        auto Ord = Spec->getInteger("ordinal");
        if (!FN || !Callee || !Ord || *Ord < 0) logicalFail("heap selector needs function/callee/ordinal");
        int64_t Index = 0;
        for (Instruction *I : Original) if (I->getFunction()->getName() == *FN)
          if (auto *Call = dyn_cast<CallInst>(I)) if (auto *CF = Call->getCalledFunction())
            if (CF->getName() == *Callee && Index++ == *Ord) {
              if (!Call->getType()->isPointerTy()) logicalFail("allocator must return pointer");
              Base = Call; After = Call;
              IRBuilder<> B(Call->getNextNode());
              if (*Callee == "calloc")
                Size = B.CreateMul(B.CreateZExtOrTrunc(Call->getArgOperand(0), I64),
                                   B.CreateZExtOrTrunc(Call->getArgOperand(1), I64));
              else {
                unsigned Arg = (*Callee == "mmap" || *Callee == "aligned_alloc" || *Callee == "realloc") ? 1 : 0;
                if (auto CustomArg = Spec->getInteger("size_arg")) Arg = (unsigned)*CustomArg;
                if (Arg >= Call->arg_size() || !Call->getArgOperand(Arg)->getType()->isIntegerTy()) logicalFail("invalid size_arg");
                Size = B.CreateZExtOrTrunc(Call->getArgOperand(Arg), I64);
              }
            }
        if (!Base) logicalFail(Twine("allocator selector did not match ") + *FN + "/" + *Callee);
        if (*Callee == "realloc") logicalFail("select original allocation; realloc preserves its descriptor automatically");
      } else logicalFail("object kind must be global/heap/stack");
      for (const auto &T : Targets) if (T.Ptr == Base) logicalFail("duplicate selector for the same object");
      auto D = logicalDescriptor(*Spec, Ty, DL);
      D["module_id"] = std::to_string(ModuleID);
      D["descriptor_id"] = (int64_t)Targets.size();
      std::string Text = logicalJSON(json::Value(json::Object(D)));
      TargetInfo.push_back(std::move(D));
      Targets.push_back({Base, After, Size, Text, StackFunction});
    }
    auto Add = [&](Instruction *I, Value *P, Type *T, Value *Length, uint32_t Mode, uint32_t Flags, bool After=false) {
      auto *PT = cast<PointerType>(P->getType());
      if (PT->getAddressSpace() || DL.isNonIntegralPointerType(PT)) { ++Unsupported; return; }
      if (!Length) {
        auto Bytes = DL.getTypeStoreSize(T);
        if (Bytes.isScalable()) { ++Unsupported; return; }
        Length = ConstantInt::get(I64, Bytes.getFixedValue());
      }
      if (auto *N = dyn_cast<ConstantInt>(Length)) if (N->isZero()) return;
      uint32_t Site = Points.size();
      Points.push_back({I, P, Length, Site, 0, Mode, Flags, After});
      SiteInfo.push_back(json::Object{{"site_id", (int64_t)Site},
        {"function", I->getFunction()->getName().str()}, {"opcode", I->getOpcodeName()},
        {"line", (int64_t)(I->getDebugLoc() ? I->getDebugLoc().getLine() : 0)}, {"mode", (int64_t)Mode}});
    };
    for (Instruction *I : Original) {
      if (!Functions.empty() && !Functions.count(I->getFunction()->getName().str())) continue;
      if (auto *L = dyn_cast<LoadInst>(I)) Add(I,L->getPointerOperand(),L->getType(),nullptr,0,(L->isAtomic()?1:0)|(L->isVolatile()?2:0));
      else if (auto *S = dyn_cast<StoreInst>(I)) Add(I,S->getPointerOperand(),S->getValueOperand()->getType(),nullptr,1,(S->isAtomic()?1:0)|(S->isVolatile()?2:0));
      else if (auto *A = dyn_cast<AtomicRMWInst>(I)) Add(I,A->getPointerOperand(),A->getValOperand()->getType(),nullptr,2,1|(A->isVolatile()?2:0));
      else if (auto *A = dyn_cast<AtomicCmpXchgInst>(I)) Add(I,A->getPointerOperand(),A->getCompareOperand()->getType(),nullptr,2,5|(A->isVolatile()?2:0),true);
      else if (auto *T = dyn_cast<MemTransferInst>(I)) {
        Add(I,T->getSource(),nullptr,T->getLength(),0,8|(T->isVolatile()?2:0));
        Add(I,T->getDest(),nullptr,T->getLength(),1,8|(T->isVolatile()?2:0));
      } else if (auto *S = dyn_cast<MemSetInst>(I)) Add(I,S->getDest(),nullptr,S->getLength(),1,8|(S->isVolatile()?2:0));
      else if (auto *II = dyn_cast<IntrinsicInst>(I)) {
        auto ID=II->getIntrinsicID();
        if (II->mayReadOrWriteMemory() && ID!=Intrinsic::lifetime_start && ID!=Intrinsic::lifetime_end &&
            ID!=Intrinsic::assume && !isa<DbgInfoIntrinsic>(II)) ++Unsupported;
      }
    }
    std::error_code EC;
    raw_fd_ostream OS("access_sites."+std::to_string(ModuleID)+".json",EC);
    if (EC) logicalFail("cannot write static report");
    OS << json::Value(json::Object{{"schema_version",3},{"module_id",std::to_string(ModuleID)},
      {"mode","logical"},{"observation_stage","frontend-before-llvm-optimization"},
      {"unsupported_instructions",(int64_t)Unsupported},{"targets",std::move(TargetInfo)},
      {"sites",std::move(SiteInfo)}});
    OS.flush(); if (OS.has_error()) logicalFail("static report write failed");
    FunctionCallee Register=M.getOrInsertFunction("__fa_object_register",FunctionType::get(Void,{PtrTy,I64,PtrTy},false));
    FunctionCallee Retire=M.getOrInsertFunction("__fa_object_retire",FunctionType::get(Void,{PtrTy,I64},false));
    FunctionCallee Resize=M.getOrInsertFunction("__fa_object_realloc",FunctionType::get(Void,{PtrTy,PtrTy,I64},false));
    FunctionCallee Record=M.getOrInsertFunction("__fa_record_logical",FunctionType::get(Void,{I64,I32,I32,PtrTy,I64,I32,I32},false));
    Function *Ctor=nullptr;
    for (const auto &T : Targets) {
      Instruction *At=nullptr;
      if (!T.After) {
        if (!Ctor) {
          Ctor=Function::Create(FunctionType::get(Void,false),GlobalValue::InternalLinkage,
                                "__fa_globals_"+std::to_string(ModuleID),M);
          IRBuilder<> B(BasicBlock::Create(C,"entry",Ctor)); B.CreateRetVoid();
          appendToGlobalCtors(M,Ctor,200);
        }
        At=Ctor->getEntryBlock().getTerminator();
      } else {
        // Size expressions may have been inserted immediately after allocator.
        At=T.After->getNextNode();
        if (auto *SI=dyn_cast<Instruction>(T.Size))
          if (SI->getParent()==T.After->getParent() && T.After->comesBefore(SI))
            At=SI->getNextNode();
      }
      IRBuilder<> B(At);
      B.CreateCall(Register,{T.Ptr,T.Size,B.CreateGlobalString(T.JSON)});
      if (T.StackFunction)
        for (BasicBlock &BB : *T.StackFunction) if (auto *R=dyn_cast<ReturnInst>(BB.getTerminator())) {
          IRBuilder<> End(R); End.CreateCall(Retire,{T.Ptr,End.getInt64(0)});
        }
    }
    for (CallInst *Call : Releases) {
      bool Unmap=Call->getCalledFunction()->getName()=="munmap";
      IRBuilder<> B(Unmap ? Call->getNextNode() : Call);
      if (Unmap) {
        // A failed munmap leaves the object live; conditional runtime retire.
        FunctionCallee U=M.getOrInsertFunction("__fa_object_munmap",FunctionType::get(Void,{PtrTy,I64,I32},false));
        B.CreateCall(U,{Call->getArgOperand(0),B.CreateZExtOrTrunc(Call->getArgOperand(1),I64),Call});
      } else B.CreateCall(Retire,{Call->getArgOperand(0),B.getInt64(0)});
    }
    for (CallInst *Call : Reallocs) {
      IRBuilder<> B(Call->getNextNode());
      B.CreateCall(Resize,{Call->getArgOperand(0),Call,B.CreateZExtOrTrunc(Call->getArgOperand(1),I64)});
    }
    for (auto &P : Points) {
      IRBuilder<> B(P.After?P.Inst->getNextNode():P.Inst);
      B.SetCurrentDebugLocation(P.Inst->getDebugLoc());
      Value *Mode=B.getInt32(P.Mode);
      if (isa<AtomicCmpXchgInst>(P.Inst)) Mode=B.CreateSelect(B.CreateExtractValue(P.Inst,1),B.getInt32(2),B.getInt32(0));
      B.CreateCall(Record,{B.getInt64(ModuleID),B.getInt32(P.Site),B.getInt32(0),P.Address,
                          B.CreateZExtOrTrunc(P.Length,I64),Mode,B.getInt32(P.Flags)});
      P.Inst->setMetadata("fieldanalysis.v2",MDNode::get(C,{}));
    }
    relaxInstrumentedAttributes(M);
    M.getOrInsertNamedMetadata("fieldanalysis.logical.instrumented");
    return PreservedAnalyses::none();
  }
};
