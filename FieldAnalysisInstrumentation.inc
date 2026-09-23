// Included by FieldAnalysisPass.cpp after the optional field metadata helpers.
// Collection precedes mutation: one point per memory operand, never per GEP.
struct MemoryPoint {
  Instruction *Inst;
  Value *Address;
  Value *Length;
  uint32_t Site, Field, Mode, Flags;
  bool After;
};

static uint64_t moduleIdentity(const Module &M) {
  uint64_t H = 14695981039346656037ULL;
  std::string Name = M.getSourceFileName() + "|" + M.getModuleIdentifier();
  for (unsigned char C : Name) { H ^= C; H *= 1099511628211ULL; }
  return H;
}

static bool isTraceableFunction(const Function &F) {
  return !F.isDeclaration() && !F.getName().starts_with("__fa_") &&
         !F.getName().starts_with("__record_field_access") &&
         !F.hasFnAttribute("fieldanalysis-runtime");
}

// Instrumentation adds IO, synchronization and pointer capture; inferred
// attributes on both definitions and their call sites are no longer valid.
static void relaxInstrumentedAttributes(Module &M) {
  auto Relax = [](auto &FnOrCall) {
    FnOrCall.setMemoryEffects(MemoryEffects::unknown());
    for (auto A : {Attribute::NoFree, Attribute::NoSync, Attribute::NoCallback,
                   Attribute::Speculatable, Attribute::WillReturn,
                   Attribute::NoUnwind}) FnOrCall.removeFnAttr(A);
    for (unsigned N = 0; N < FnOrCall.arg_size(); ++N) {
#if LLVM_VERSION_MAJOR >= 22
      FnOrCall.removeParamAttr(N, Attribute::Captures);
#else
      FnOrCall.removeParamAttr(N, Attribute::NoCapture);
#endif
      FnOrCall.removeParamAttr(N, Attribute::ReadOnly);
      FnOrCall.removeParamAttr(N, Attribute::ReadNone);
      FnOrCall.removeParamAttr(N, Attribute::WriteOnly);
    }
  };
  for (Function &F : M) {
    if (!F.isDeclaration()) Relax(F);
    for (BasicBlock &BB : F) for (Instruction &I : BB)
      if (auto *CB = dyn_cast<CallBase>(&I))
        if (auto *Callee = CB->getCalledFunction())
          if (!Callee->isDeclaration()) Relax(*CB);
  }
}

PreservedAnalyses GEPFieldAnalysisPass::run(Module &M,
                                         ModuleAnalysisManager &) {
  const DataLayout &DL = M.getDataLayout();
  LLVMContext &C = M.getContext();
  std::set<std::string> Functions(SelectedFunctions.begin(), SelectedFunctions.end());
  for (const auto &Name : Functions) {
    auto *F = M.getFunction(Name);
    if (!F || !isTraceableFunction(*F))
      report_fatal_error(Twine("field-analysis: function is missing or excluded: ") + Name);
  }
  std::vector<MemoryPoint> Points;
  std::vector<GEPRecord> Records;
  std::map<std::pair<std::string, uint32_t>, uint32_t> FieldIds;
  uint32_t NextField = 0, NextSite = 0;
  uint64_t Unsupported = 0;
  uint64_t MarkedCount = 0;
  for (Function &F : M) for (BasicBlock &BB : F) for (Instruction &I : BB)
    if (I.getMetadata("fieldanalysis.v2")) ++MarkedCount;
  // A later round on partially instrumented IR gets its own site namespace.
  const uint64_t ModuleId = moduleIdentity(M) ^ (MarkedCount * 1099511628211ULL);
  bool SawMarked = false;
  auto Add = [&](Instruction &I, Value *Ptr, Type *Ty, Value *Length,
                 uint32_t Mode, uint32_t Flags, bool After = false) {
    auto *PT = cast<PointerType>(Ptr->getType());
    if (PT->getAddressSpace() != 0 || DL.getPointerSizeInBits(0) != 64 ||
        DL.isNonIntegralPointerType(PT)) { ++Unsupported; return; }
    if (!Length) {
      TypeSize Size = DL.getTypeStoreSize(Ty);
      if (Size.isScalable()) { ++Unsupported; return; }
      Length = ConstantInt::get(Type::getInt64Ty(C), Size.getFixedValue());
    }
    if (auto *N = dyn_cast<ConstantInt>(Length))
      if (N->isZero()) return;
    // Type/field recognition enriches records; it never decides coverage.
    auto Info = analyzeGEP(Ptr, &I, DL, M, FieldIds, NextField);
    if (!Info) Info = createScalarFieldInfo(Ptr, &I, DL, FieldIds, NextField);
    if (!Info) {
      FieldInfo Unknown{};
      Unknown.struct_name = "scalar.unknown";
      Unknown.field_type = "unknown";
      auto Key = std::make_pair(Unknown.struct_name, 0U);
      auto It = FieldIds.emplace(Key, NextField);
      if (It.second) ++NextField;
      Unknown.field_id = It.first->second;
      Info = std::move(Unknown);
    }
    uint32_t Site = NextSite++;
    Points.push_back({&I, Ptr, Length, Site, Info->field_id, Mode, Flags, After});
    Records.push_back({(Twine(I.getFunction()->getName()) + "::site" +
                        Twine(Site)).str(), std::move(*Info)});
  };

  for (Function &F : M) {
    if (!isTraceableFunction(F) ||
        (!Functions.empty() && !Functions.count(F.getName().str()))) continue;
    for (BasicBlock &BB : F) for (Instruction &I : BB) {
      if (I.getMetadata("fieldanalysis.v2")) { SawMarked = true; continue; }
      if (auto *L = dyn_cast<LoadInst>(&I))
        Add(I, L->getPointerOperand(), L->getType(), nullptr, 0,
            (L->isAtomic() ? 1U : 0U) | (L->isVolatile() ? 2U : 0U));
      else if (auto *S = dyn_cast<StoreInst>(&I))
        Add(I, S->getPointerOperand(), S->getValueOperand()->getType(), nullptr,
            1, (S->isAtomic() ? 1U : 0U) | (S->isVolatile() ? 2U : 0U));
      else if (auto *A = dyn_cast<AtomicRMWInst>(&I))
        Add(I, A->getPointerOperand(), A->getValOperand()->getType(), nullptr,
            2, 1U | (A->isVolatile() ? 2U : 0U));
      else if (auto *A = dyn_cast<AtomicCmpXchgInst>(&I))
        Add(I, A->getPointerOperand(), A->getCompareOperand()->getType(), nullptr,
            2, 1U | 4U | (A->isVolatile() ? 2U : 0U), true);
      else if (auto *T = dyn_cast<MemTransferInst>(&I)) {
        Add(I, T->getSource(), nullptr, T->getLength(), 0,
            8U | (T->isVolatile() ? 2U : 0U));
        Add(I, T->getDest(), nullptr, T->getLength(), 1,
            8U | (T->isVolatile() ? 2U : 0U));
      } else if (auto *S = dyn_cast<MemSetInst>(&I))
        Add(I, S->getDest(), nullptr, S->getLength(), 1,
            8U | (S->isVolatile() ? 2U : 0U));
      else if (auto *II = dyn_cast<IntrinsicInst>(&I)) {
        // Lifetime/debug/assume are not data accesses. Other memory intrinsics
        // require explicit lowering (e.g. masks), never pretend to trace them.
        auto ID = II->getIntrinsicID();
        if (II->mayReadOrWriteMemory() && ID != Intrinsic::lifetime_start &&
            ID != Intrinsic::lifetime_end && ID != Intrinsic::assume &&
            !isa<DbgInfoIntrinsic>(II)) ++Unsupported;
      }
    }
  }
  if (Points.empty() && SawMarked && !Unsupported) return PreservedAnalyses::all();

  std::string Suffix = (Twine(ModuleId)).str();
  auto Write = [&](const std::string &Name, auto Emit) {
    std::error_code EC;
    raw_fd_ostream OS(Name, EC, sys::fs::OF_Text);
    if (EC) report_fatal_error(Twine("FieldAnalysis cannot write ") + Name + ": " + EC.message());
    Emit(OS);
    OS.flush();
    if (OS.has_error()) report_fatal_error(Twine("FieldAnalysis write failed: ") + Name);
  };
  Write("gep_field_map." + Suffix + ".json", [&](raw_ostream &OS) { writeFieldMapJson(Records, OS); });
  Write("struct_layout." + Suffix + ".json", [&](raw_ostream &OS) { writeStructLayoutJson(M, DL, OS); });
  // Compatibility aliases for the existing single-module analysis commands.
  Write("gep_field_map.json", [&](raw_ostream &OS) { writeFieldMapJson(Records, OS); });
  Write("struct_layout.json", [&](raw_ostream &OS) { writeStructLayoutJson(M, DL, OS); });
  Write("access_sites." + Suffix + ".json", [&](raw_ostream &OS) {
    JsonWriter W(OS);
    W.beginObject();
    W.key("schema_version").value(2U);
    W.key("module_id").value(Suffix);
    W.key("source").value(M.getSourceFileName());
    W.key("unsupported_instructions").value(Unsupported);
    W.key("sites"); W.beginArray();
    for (const auto &P : Points) {
      W.beginObject();
      W.key("site_id").value(P.Site); W.key("field_id").value(P.Field);
      W.key("function").value(P.Inst->getFunction()->getName().str());
      W.key("opcode").value(std::string(P.Inst->getOpcodeName()));
      W.key("mode").value(P.Mode); W.key("flags").value(P.Flags);
      W.key("observation").value(std::string(P.After ? "after" : "before"));
      W.endObject();
    }
    W.endArray(); W.endObject();
  });
  if (Unsupported) errs() << "FieldAnalysis: " << Unsupported
                          << " unsupported memory operations; see access_sites report\n";
  if (FieldAnalysisOnly || Points.empty()) return PreservedAnalyses::all();
  if (SimpleAccessRecord)
    errs() << "FieldAnalysis: simple mode omits the six-field trace\n";
  Type *I32 = Type::getInt32Ty(C), *I64 = Type::getInt64Ty(C);
  FunctionCallee Record = M.getOrInsertFunction("__fa_record_access_v2",
      FunctionType::get(Type::getVoidTy(C), {I64, I32, I32,
        PointerType::getUnqual(C), I64, I32, I32}, false));
  FunctionCallee Simple = M.getOrInsertFunction("__record_field_access",
      FunctionType::get(Type::getVoidTy(C), {I32}, false));
  for (auto &P : Points) {
    IRBuilder<> B(P.After ? P.Inst->getNextNode() : P.Inst);
    B.SetCurrentDebugLocation(P.Inst->getDebugLoc());
    Value *Mode = B.getInt32(P.Mode);
    if (isa<AtomicCmpXchgInst>(P.Inst)) {
      Value *Succeeded = B.CreateExtractValue(P.Inst, 1);
      Mode = B.CreateSelect(Succeeded, B.getInt32(2), B.getInt32(0));
    }
    if (SimpleAccessRecord) B.CreateCall(Simple, {B.getInt32(P.Field)});
    else B.CreateCall(Record, {B.getInt64(ModuleId), B.getInt32(P.Site),
      B.getInt32(P.Field), P.Address, B.CreateZExtOrTrunc(P.Length, I64),
      Mode, B.getInt32(P.Flags)});
    P.Inst->setMetadata("fieldanalysis.v2", MDNode::get(C, {}));
  }
  relaxInstrumentedAttributes(M);
  return PreservedAnalyses::none();
}
