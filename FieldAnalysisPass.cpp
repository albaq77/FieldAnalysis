#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/GetElementPtrTypeIterator.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Operator.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include <map>
#include <string>
#include <optional>
#include <vector>
#include <set>

using namespace llvm;

static cl::opt<bool> FieldAnalysisOnly(
    "field-analysis-only", cl::init(false),
    cl::desc("Only analyze, do not instrument"));

struct AccessStep {
  std::string struct_name;
  uint32_t field_idx;
  uint64_t field_offset;
};

struct FieldInfo {
  std::string struct_name;
  uint32_t field_idx;
  uint64_t byte_offset;
  uint32_t field_id;
  std::vector<AccessStep> access_path;
  std::string source_file;
  uint32_t source_line;
  uint32_t source_col;
};

struct InstrumentPoint {
  Instruction *insert_before;
  uint32_t field_id;
  Value *gep_value;
  int is_write;
};

struct GEPFieldAnalysisPass : PassInfoMixin<GEPFieldAnalysisPass> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);
  static bool isRequired() { return true; }
};

static std::string escapeJsonString(const std::string &S) {
  std::string Result;
  Result.reserve(S.size());
  for (char C : S) {
    switch (C) {
    case '"':  Result += "\\\""; break;
    case '\\': Result += "\\\\"; break;
    case '\b': Result += "\\b";  break;
    case '\f': Result += "\\f";  break;
    case '\n': Result += "\\n";  break;
    case '\r': Result += "\\r";  break;
    case '\t': Result += "\\t";  break;
    default:
      if (static_cast<unsigned char>(C) < 0x20) {
        raw_string_ostream RSOS(Result);
        RSOS << "\\u" << format_hex_no_prefix(static_cast<unsigned>(C), 4);
      } else {
        Result += C;
      }
      break;
    }
  }
  return Result;
}

static bool isGEPValue(Value *V) {
  if (isa<GetElementPtrInst>(V))
    return true;
  if (auto *CE = dyn_cast<ConstantExpr>(V))
    return CE->getOpcode() == Instruction::GetElementPtr;
  return false;
}

static Type *getGEPSourceElementType(Value *GEPV) {
  if (auto *GEP = dyn_cast<GetElementPtrInst>(GEPV))
    return GEP->getSourceElementType();
  if (auto *CE = dyn_cast<ConstantExpr>(GEPV))
    if (CE->getOpcode() == Instruction::GetElementPtr)
      return cast<GEPOperator>(CE)->getSourceElementType();
  return nullptr;
}

static SmallVector<Value *, 4> getGEPIndices(Value *GEPV) {
  SmallVector<Value *, 4> idx;
  if (auto *GEP = dyn_cast<GetElementPtrInst>(GEPV)) {
    for (unsigned I = 1, E = GEP->getNumOperands(); I != E; ++I)
      idx.push_back(GEP->getOperand(I));
  } else if (auto *CE = dyn_cast<ConstantExpr>(GEPV)) {
    if (CE->getOpcode() == Instruction::GetElementPtr) {
      for (unsigned I = 1, E = CE->getNumOperands(); I != E; ++I)
        idx.push_back(CE->getOperand(I));
    }
  }
  return idx;
}

static Value *getGEPPointerOperand(Value *GEPV) {
  if (auto *GEP = dyn_cast<GetElementPtrInst>(GEPV))
    return GEP->getPointerOperand();
  if (auto *CE = dyn_cast<ConstantExpr>(GEPV))
    if (CE->getOpcode() == Instruction::GetElementPtr)
      return CE->getOperand(0);
  return nullptr;
}

static StructType *findStructTypeInModule(Module &M, const std::string &TBAA) {
  for (StructType *ST : M.getIdentifiedStructTypes()) {
    if (!ST->hasName())
      continue;
    std::string Name = ST->getName().str();
    if (Name == TBAA)
      return ST;
    auto stripPrefix = [](const std::string &S, const std::string &P) {
      return S.size() > P.size() && S.substr(0, P.size()) == P
                 ? S.substr(P.size())
                 : S;
    };
    if (stripPrefix(Name, "struct.") == TBAA)
      return ST;
    if (stripPrefix(Name, "class.") == TBAA)
      return ST;
  }
  return nullptr;
}

static unsigned getContainingFieldIndex(StructType *ST, const DataLayout &DL,
                                         uint64_t Offset) {
  const StructLayout *SL = DL.getStructLayout(ST);
  unsigned NumElements = ST->getNumElements();
  for (unsigned i = 0; i < NumElements; ++i) {
    uint64_t ElemBegin = SL->getElementOffset(i);
    Type *ElemTy = ST->getElementType(i);
    uint64_t ElemSize = DL.getTypeAllocSize(ElemTy);
    if (Offset >= ElemBegin && Offset < ElemBegin + ElemSize)
      return i;
  }
  unsigned Last = 0;
  for (unsigned i = 0; i < NumElements; ++i) {
    if (SL->getElementOffset(i) <= Offset)
      Last = i;
  }
  return Last;
}

static bool buildAccessPathRecursive(
    StructType *ST, uint64_t Offset, const DataLayout &DL,
    std::vector<AccessStep> &Path,
    StructType *&LeafStruct, uint32_t &LeafFieldIdx,
    uint64_t &LeafTotalOffset) {
  if (!ST || ST->isOpaque() || !ST->hasName())
    return false;

  const StructLayout *SL = DL.getStructLayout(ST);
  unsigned FieldIdx = getContainingFieldIndex(ST, DL, Offset);
  uint64_t FieldOffset = SL->getElementOffset(FieldIdx);

  AccessStep Step;
  Step.struct_name = ST->getName().str();
  Step.field_idx = FieldIdx;
  Step.field_offset = FieldOffset;
  Path.push_back(Step);

  Type *FieldType = ST->getElementType(FieldIdx);

  if (auto *NestedST = dyn_cast<StructType>(FieldType)) {
    uint64_t NestedOffset = Offset - FieldOffset;
    return buildAccessPathRecursive(NestedST, NestedOffset, DL, Path,
                                    LeafStruct, LeafFieldIdx, LeafTotalOffset);
  }

  LeafStruct = ST;
  LeafFieldIdx = FieldIdx;
  LeafTotalOffset = Offset;
  return true;
}

static std::optional<FieldInfo> analyzeGEPFromTBAA(
    Instruction *UserInst, Value *GEPV,
    const DataLayout &DL, Module &M,
    std::map<std::pair<std::string, uint32_t>, uint32_t> &FieldIdMap,
    uint32_t &NextFieldId) {
  MDNode *TBAA = UserInst->getMetadata(LLVMContext::MD_tbaa);
  if (!TBAA || TBAA->getNumOperands() < 3)
    return std::nullopt;

  auto *BaseTypeNode = dyn_cast_or_null<MDNode>(TBAA->getOperand(0));
  auto *OffsetMD =
      dyn_cast_or_null<ConstantAsMetadata>(TBAA->getOperand(2));
  if (!BaseTypeNode || !OffsetMD)
    return std::nullopt;

  uint64_t FieldOffset =
      cast<ConstantInt>(OffsetMD->getValue())->getZExtValue();

  if (BaseTypeNode->getNumOperands() < 1)
    return std::nullopt;
  auto *StructNameMD =
      dyn_cast_or_null<MDString>(BaseTypeNode->getOperand(0));
  if (!StructNameMD)
    return std::nullopt;
  std::string TBAAStructName = StructNameMD->getString().str();

  StructType *BaseST = findStructTypeInModule(M, TBAAStructName);
  if (!BaseST)
    return std::nullopt;

  std::vector<AccessStep> AccessPath;
  StructType *LeafStruct = nullptr;
  uint32_t LeafFieldIdx = 0;
  uint64_t LeafTotalOffset = 0;

  if (!buildAccessPathRecursive(BaseST, FieldOffset, DL, AccessPath,
                                LeafStruct, LeafFieldIdx, LeafTotalOffset)) {
    return std::nullopt;
  }

  uint64_t gep_byte_offset = FieldOffset;
  if (auto *GEPOp = dyn_cast<GEPOperator>(GEPV)) {
    APInt AccOffset(DL.getIndexTypeSizeInBits(GEPOp->getType()), 0);
    if (GEPOp->accumulateConstantOffset(DL, AccOffset))
      gep_byte_offset = AccOffset.getZExtValue();
  }

  std::string LeafStructName = LeafStruct->getName().str();
  auto Key = std::make_pair(LeafStructName, LeafFieldIdx);
  uint32_t FieldId;
  auto It = FieldIdMap.find(Key);
  if (It != FieldIdMap.end()) {
    FieldId = It->second;
  } else {
    FieldId = NextFieldId++;
    FieldIdMap[Key] = FieldId;
  }

  FieldInfo Info;
  Info.struct_name = LeafStructName;
  Info.field_idx = LeafFieldIdx;
  Info.byte_offset = gep_byte_offset;
  Info.field_id = FieldId;
  Info.access_path = std::move(AccessPath);
  Info.source_file = "";
  Info.source_line = 0;
  Info.source_col = 0;

  if (UserInst->getDebugLoc()) {
    const DebugLoc &DLoc = UserInst->getDebugLoc();
    Info.source_line = DLoc.getLine();
    Info.source_col = DLoc.getCol();
    if (auto *Scope = dyn_cast<DIScope>(DLoc.getScope())) {
      Info.source_file = Scope->getFilename().str();
    }
  } else if (auto *GEPI = dyn_cast<GetElementPtrInst>(GEPV)) {
    if (GEPI->getDebugLoc()) {
      const DebugLoc &DLoc = GEPI->getDebugLoc();
      Info.source_line = DLoc.getLine();
      Info.source_col = DLoc.getCol();
      if (auto *Scope = dyn_cast<DIScope>(DLoc.getScope())) {
        Info.source_file = Scope->getFilename().str();
      }
    }
  }

  return Info;
}

static std::optional<FieldInfo> analyzeGEPTyped(
    Value *GEPV, const DataLayout &DL,
    std::map<std::pair<std::string, uint32_t>, uint32_t> &FieldIdMap,
    uint32_t &NextFieldId) {

  Type *SourceTy = getGEPSourceElementType(GEPV);
  if (!SourceTy)
    return std::nullopt;

  auto Indices = getGEPIndices(GEPV);
  if (Indices.empty())
    return std::nullopt;

  StructType *LeafStruct = nullptr;
  uint32_t LeafFieldIdx = 0;
  uint64_t LeafByteOffset = 0;
  std::vector<AccessStep> AccessPath;

  Type *CurTy = SourceTy;
  bool HasStruct = false;

  for (unsigned i = 0; i < Indices.size(); ++i) {
    if (auto *ST = dyn_cast<StructType>(CurTy)) {
      HasStruct = true;
      if (ST->isOpaque() || !ST->hasName())
        return std::nullopt;

      auto *CI = dyn_cast<ConstantInt>(Indices[i]);
      if (!CI)
        return std::nullopt;

      uint32_t FieldIdx = static_cast<uint32_t>(CI->getZExtValue());
      const StructLayout *SL = DL.getStructLayout(ST);
      uint64_t FieldOffset = SL->getElementOffset(FieldIdx);

      AccessStep Step;
      Step.struct_name = ST->getName().str();
      Step.field_idx = FieldIdx;
      Step.field_offset = FieldOffset;
      AccessPath.push_back(Step);

      LeafStruct = ST;
      LeafFieldIdx = FieldIdx;
      LeafByteOffset += FieldOffset;
      CurTy = ST->getElementType(FieldIdx);

      if (auto *NestedST = dyn_cast<StructType>(CurTy)) {
        continue;
      }
    } else if (CurTy->isArrayTy()) {
      auto *CI = dyn_cast<ConstantInt>(Indices[i]);
      if (CI) {
        uint64_t ElemSize = DL.getTypeAllocSize(CurTy->getArrayElementType());
        LeafByteOffset += CI->getZExtValue() * ElemSize;
      }
      CurTy = CurTy->getArrayElementType();
    } else if (auto *VT = dyn_cast<VectorType>(CurTy)) {
      auto *CI = dyn_cast<ConstantInt>(Indices[i]);
      if (CI) {
        TypeSize ElemSize = VT->getElementType()->getPrimitiveSizeInBits();
        LeafByteOffset +=
            CI->getZExtValue() * (ElemSize.getFixedValue() / 8);
      }
      CurTy = VT->getElementType();
    } else if (CurTy->isIntegerTy(8)) {
      auto *CI = dyn_cast<ConstantInt>(Indices[i]);
      if (CI)
        LeafByteOffset += CI->getZExtValue();
    } else {
      auto *CI = dyn_cast<ConstantInt>(Indices[i]);
      if (CI) {
        uint64_t ElemSize = DL.getTypeAllocSize(CurTy);
        LeafByteOffset += CI->getZExtValue() * ElemSize;
      }
      break;
    }
  }

  if (!HasStruct || !LeafStruct)
    return std::nullopt;

  std::string StructName = LeafStruct->getName().str();
  auto Key = std::make_pair(StructName, LeafFieldIdx);
  uint32_t FieldId;
  auto It = FieldIdMap.find(Key);
  if (It != FieldIdMap.end()) {
    FieldId = It->second;
  } else {
    FieldId = NextFieldId++;
    FieldIdMap[Key] = FieldId;
  }

  FieldInfo Info;
  Info.struct_name = StructName;
  Info.field_idx = LeafFieldIdx;
  Info.byte_offset = LeafByteOffset;
  Info.field_id = FieldId;
  Info.access_path = std::move(AccessPath);
  Info.source_file = "";
  Info.source_line = 0;
  Info.source_col = 0;

  if (auto *GEPI = dyn_cast<GetElementPtrInst>(GEPV)) {
    if (GEPI->getDebugLoc()) {
      const DebugLoc &DLoc = GEPI->getDebugLoc();
      Info.source_line = DLoc.getLine();
      Info.source_col = DLoc.getCol();
      if (auto *Scope = dyn_cast<DIScope>(DLoc.getScope())) {
        Info.source_file = Scope->getFilename().str();
      }
    }
  }

  return Info;
}

static std::optional<FieldInfo> analyzeGEPDefUse(
    Value *GEPV, const DataLayout &DL, Module &M,
    std::map<std::pair<std::string, uint32_t>, uint32_t> &FieldIdMap,
    uint32_t &NextFieldId) {

  auto Indices = getGEPIndices(GEPV);
  uint64_t GEPOffset = 0;
  Type *CurTy = getGEPSourceElementType(GEPV);
  bool AllConstant = true;

  for (unsigned i = 0; i < Indices.size(); ++i) {
    auto *CI = dyn_cast<ConstantInt>(Indices[i]);
    if (!CI) {
      AllConstant = false;
      break;
    }
    if (!CurTy)
      break;
    if (auto *ST = dyn_cast<StructType>(CurTy)) {
      const StructLayout *SL = DL.getStructLayout(ST);
      GEPOffset += SL->getElementOffset(CI->getZExtValue());
      CurTy = ST->getElementType(CI->getZExtValue());
    } else if (CurTy->isArrayTy()) {
      GEPOffset +=
          CI->getZExtValue() * DL.getTypeAllocSize(CurTy->getArrayElementType());
      CurTy = CurTy->getArrayElementType();
    } else if (CurTy->isIntegerTy(8)) {
      GEPOffset += CI->getZExtValue();
    } else {
      GEPOffset += CI->getZExtValue() * DL.getTypeAllocSize(CurTy);
      break;
    }
  }

  if (!AllConstant)
    return std::nullopt;

  Value *PtrOp = getGEPPointerOperand(GEPV);
  if (!PtrOp)
    return std::nullopt;

  StructType *ST = nullptr;
  if (auto *GV = dyn_cast<GlobalVariable>(PtrOp)) {
    ST = dyn_cast<StructType>(GV->getValueType());
  } else if (auto *AI = dyn_cast<AllocaInst>(PtrOp)) {
    ST = dyn_cast<StructType>(AI->getAllocatedType());
  } else if (auto *BCI = dyn_cast<BitCastInst>(PtrOp)) {
    Value *Src = BCI->getOperand(0);
    if (auto *GV2 = dyn_cast<GlobalVariable>(Src))
      ST = dyn_cast<StructType>(GV2->getValueType());
    else if (auto *AI2 = dyn_cast<AllocaInst>(Src))
      ST = dyn_cast<StructType>(AI2->getAllocatedType());
    else if (auto *CI2 = dyn_cast<CallBase>(Src))
      ST = dyn_cast<StructType>(CI2->getType());
  } else if (auto *CI = dyn_cast<CallBase>(PtrOp)) {
    ST = dyn_cast<StructType>(CI->getType());
  }

  if (!ST || ST->isOpaque() || !ST->hasName())
    return std::nullopt;

  const StructLayout *SL = DL.getStructLayout(ST);
  unsigned FieldIdx = getContainingFieldIndex(ST, DL, GEPOffset);

  std::string StructName = ST->getName().str();
  auto Key = std::make_pair(StructName, FieldIdx);
  uint32_t FieldId;
  auto It = FieldIdMap.find(Key);
  if (It != FieldIdMap.end()) {
    FieldId = It->second;
  } else {
    FieldId = NextFieldId++;
    FieldIdMap[Key] = FieldId;
  }

  FieldInfo Info;
  Info.struct_name = StructName;
  Info.field_idx = FieldIdx;
  Info.byte_offset = GEPOffset;
  Info.field_id = FieldId;
  Info.access_path = {
      {StructName, FieldIdx, SL->getElementOffset(FieldIdx)}};
  Info.source_file = "";
  Info.source_line = 0;
  Info.source_col = 0;

  if (auto *GEPI = dyn_cast<GetElementPtrInst>(GEPV)) {
    if (GEPI->getDebugLoc()) {
      const DebugLoc &DLoc = GEPI->getDebugLoc();
      Info.source_line = DLoc.getLine();
      Info.source_col = DLoc.getCol();
      if (auto *Scope = dyn_cast<DIScope>(DLoc.getScope())) {
        Info.source_file = Scope->getFilename().str();
      }
    }
  }

  return Info;
}

static std::optional<FieldInfo> analyzeGEP(
    Value *GEPV, Instruction *UserInst,
    const DataLayout &DL, Module &M,
    std::map<std::pair<std::string, uint32_t>, uint32_t> &FieldIdMap,
    uint32_t &NextFieldId) {

  if (auto *GEPOp = dyn_cast<GEPOperator>(GEPV)) {
    Type *SrcTy = GEPOp->getSourceElementType();
    if (SrcTy->isScalableTy())
      return std::nullopt;
  }

  if (UserInst && UserInst != GEPV) {
    auto TBAAInfo =
        analyzeGEPFromTBAA(UserInst, GEPV, DL, M, FieldIdMap, NextFieldId);
    if (TBAAInfo)
      return TBAAInfo;
  }

  if (auto *GEPI = dyn_cast<GetElementPtrInst>(GEPV)) {
    Instruction *TBAAUser = nullptr;
    for (User *U : GEPI->users()) {
      if (auto *UI = dyn_cast<Instruction>(U)) {
        if (UI->getMetadata(LLVMContext::MD_tbaa)) {
          TBAAUser = UI;
          break;
        }
      }
    }
    if (TBAAUser) {
      auto TBAAInfo = analyzeGEPFromTBAA(TBAAUser, GEPV, DL, M, FieldIdMap,
                                          NextFieldId);
      if (TBAAInfo)
        return TBAAInfo;
    }
  }

  auto TypedInfo = analyzeGEPTyped(GEPV, DL, FieldIdMap, NextFieldId);
  if (TypedInfo)
    return TypedInfo;

  auto DefUseInfo = analyzeGEPDefUse(GEPV, DL, M, FieldIdMap, NextFieldId);
  if (DefUseInfo)
    return DefUseInfo;

  return std::nullopt;
}

PreservedAnalyses GEPFieldAnalysisPass::run(Module &M,
                                            ModuleAnalysisManager &MAM) {
  if (M.getIdentifiedStructTypes().empty())
    return PreservedAnalyses::all();

  const DataLayout &DL = M.getDataLayout();
  std::map<std::pair<std::string, uint32_t>, uint32_t> FieldIdMap;
  uint32_t NextFieldId = 0;

  struct GEPRecord {
    std::string map_key;
    FieldInfo info;
  };
  std::vector<GEPRecord> Records;
  std::set<Value *> ProcessedGEPs;
  std::vector<InstrumentPoint> InstrumentPoints;

  for (Function &F : M) {
    if (F.isDeclaration())
      continue;
    for (BasicBlock &BB : F) {
      unsigned InstIdx = 0;

      for (Instruction &I : BB) {
        MDNode *TBAA = I.getMetadata(LLVMContext::MD_tbaa);
        bool HasTBAA = (TBAA != nullptr);
        bool HitGEP = false;

        for (Use &U : I.operands()) {
          Value *V = U.get();
          if (!isGEPValue(V))
            continue;

          HitGEP = true;
          if (ProcessedGEPs.count(V))
            continue;

          Instruction *UserInst = HasTBAA ? &I : nullptr;
          auto Info =
              analyzeGEP(V, UserInst, DL, M, FieldIdMap, NextFieldId);
          if (!Info)
            continue;

          ProcessedGEPs.insert(V);
          uint32_t Fid = Info->field_id;

          std::string MapKey;
          if (auto *GEPI = dyn_cast<GetElementPtrInst>(V)) {
            MapKey = (Twine(F.getName()) + "::" + BB.getName() + "::" +
                      Twine(InstIdx) + "_gep")
                         .str();
          } else {
            MapKey = (Twine(F.getName()) + "::" + BB.getName() + "::" +
                      Twine(InstIdx) + "_constexpr")
                         .str();
          }

          Records.push_back({MapKey, std::move(*Info)});

          int rw_flag = isa<StoreInst>(&I) ? 1 :
                        isa<LoadInst>(&I) ? 0 :
                        isa<MemCpyInst>(&I) || isa<MemSetInst>(&I) ? 2 : 0;
          InstrumentPoints.push_back({&I, Fid, V, rw_flag});
        }

        if (!HitGEP && isa<GetElementPtrInst>(&I)) {
          auto *GEP = cast<GetElementPtrInst>(&I);
          if (ProcessedGEPs.count(GEP)) {
            ++InstIdx;
            continue;
          }

          auto Info =
              analyzeGEP(GEP, GEP, DL, M, FieldIdMap, NextFieldId);
          if (Info) {
            ProcessedGEPs.insert(GEP);
            uint32_t Fid = Info->field_id;

            std::string MapKey = (Twine(F.getName()) + "::" + BB.getName() +
                                  "::" + Twine(InstIdx) + "_standalone")
                                     .str();

            Records.push_back({MapKey, std::move(*Info)});

            int default_rw = 0;
            for (User *U : GEP->users()) {
              if (isa<StoreInst>(U)) { default_rw = 1; break; }
              if (isa<MemCpyInst>(U)) { default_rw = 2; break; }
            }
            InstrumentPoints.push_back({GEP, Fid, GEP, default_rw});
          }
        }

        ++InstIdx;
      }
    }
  }

  {
    std::error_code EC;
    raw_fd_ostream OS("gep_field_map.json", EC, sys::fs::OF_Text);
    if (!EC) {
      OS << "{\n";
      bool First = true;
      for (auto &Rec : Records) {
        if (!First)
          OS << ",\n";
        First = false;
        OS << "  \"" << escapeJsonString(Rec.map_key) << "\": {";
        OS << "\"struct\": \"" << escapeJsonString(Rec.info.struct_name)
           << "\", ";
        OS << "\"field\": " << Rec.info.field_idx << ", ";
        OS << "\"offset\": " << Rec.info.byte_offset << ", ";
        OS << "\"id\": " << Rec.info.field_id << ", ";

        OS << "\"source\": {";
        OS << "\"file\": \"" << escapeJsonString(Rec.info.source_file)
           << "\", ";
        OS << "\"line\": " << Rec.info.source_line << ", ";
        OS << "\"col\": " << Rec.info.source_col;
        OS << "}, ";

        OS << "\"access_path\": [";
        for (size_t i = 0; i < Rec.info.access_path.size(); ++i) {
          if (i > 0)
            OS << ", ";
          const auto &Step = Rec.info.access_path[i];
          OS << "{\"struct\": \"" << escapeJsonString(Step.struct_name)
             << "\", \"field\": " << Step.field_idx
             << ", \"field_offset\": " << Step.field_offset << "}";
        }
        OS << "]";

        OS << "}";
      }
      OS << "\n}\n";
    }
  }

  {
    std::error_code EC2;
    raw_fd_ostream LayoutOS("struct_layout.json", EC2, sys::fs::OF_Text);
    if (!EC2) {
      LayoutOS << "{\n";

      LayoutOS << "  \"structs\": {\n";
      bool FirstStruct = true;
      for (StructType *ST : M.getIdentifiedStructTypes()) {
        if (ST->isOpaque() || !ST->hasName()) continue;
        if (!FirstStruct) LayoutOS << ",\n";
        FirstStruct = false;

        std::string StructName = escapeJsonString(ST->getName().str());
        uint64_t TotalSize = DL.getTypeAllocSize(ST);
        LayoutOS << "    \"" << StructName << "\": {\n";
        LayoutOS << "      \"size\": " << TotalSize << ",\n";
        LayoutOS << "      \"fields\": [\n";

        const StructLayout *SL = DL.getStructLayout(ST);
        for (unsigned i = 0; i < ST->getNumElements(); ++i) {
          if (i > 0) LayoutOS << ",\n";
          Type *ET = ST->getElementType(i);
          std::string TypeStr;
          raw_string_ostream TSS(TypeStr);
          ET->print(TSS);

          LayoutOS << "        {\"idx\": " << i
                   << ", \"type\": \"" << escapeJsonString(TSS.str()) << "\""
                   << ", \"offset\": " << SL->getElementOffset(i)
                   << ", \"size\": " << DL.getTypeAllocSize(ET) << "}";
        }
        LayoutOS << "\n      ]\n    }";
      }
      LayoutOS << "\n  },\n";

      LayoutOS << "  \"variables\": {\n";

      LayoutOS << "    \"global\": [\n";
      bool FirstGV = true;
      for (GlobalVariable &GV : M.globals()) {
        Type *Ty = GV.getValueType();
        if (!isa<StructType>(Ty)) continue;
        auto *ST = cast<StructType>(Ty);
        if (ST->isOpaque() || !ST->hasName()) continue;
        if (!FirstGV) LayoutOS << ",\n";
        FirstGV = false;
        LayoutOS << "      {\"name\": \"" << escapeJsonString(GV.getName().str()) << "\""
                 << ", \"type\": \"" << escapeJsonString(ST->getName().str()) << "\""
                 << ", \"size\": " << DL.getTypeAllocSize(ST);
        unsigned Line = 0;
        std::string FilePath;
        if (MDNode *MD = GV.getMetadata(LLVMContext::MD_dbg)) {
          if (auto *GVE = dyn_cast<DIGlobalVariableExpression>(MD)) {
            if (auto *DGV = GVE->getVariable()) {
              Line = DGV->getLine();
              if (auto *File = DGV->getFile()) {
                StringRef Dir = File->getDirectory();
                StringRef Filename = File->getFilename();
                if (!Dir.empty())
                  FilePath = (Dir + "/" + Filename).str();
                else
                  FilePath = Filename.str();
              }
            }
          }
        }
        LayoutOS << ", \"file\": \"" << escapeJsonString(FilePath) << "\""
                 << ", \"line\": " << Line << "}";
      }
      LayoutOS << "\n    ],\n";

      LayoutOS << "    \"heap_sites\": [\n";
      bool FirstHeap = true;
      for (Function &F : M) {
        for (BasicBlock &BB : F) {
          for (Instruction &I : BB) {
            auto *CB = dyn_cast<CallBase>(&I);
            if (!CB) continue;
            StringRef Callee = CB->getCalledFunction() ? CB->getCalledFunction()->getName() : "";
            if (Callee != "malloc" && Callee != "calloc" && Callee != "realloc") continue;

            StructType *HeapST = nullptr;
            for (User *U : CB->users()) {
              if (auto *UI = dyn_cast<Instruction>(U)) {
                if (MDNode *TBAA = UI->getMetadata(LLVMContext::MD_tbaa)) {
                  if (TBAA->getNumOperands() >= 1) {
                    if (auto *BaseMD = dyn_cast<MDNode>(TBAA->getOperand(0))) {
                      if (BaseMD->getNumOperands() >= 1) {
                        if (auto *NameMD = dyn_cast<MDString>(BaseMD->getOperand(0))) {
                          HeapST = findStructTypeInModule(M, NameMD->getString().str());
                          break;
                        }
                      }
                    }
                  }
                }
              }
            }
            if (!HeapST) continue;

            if (!FirstHeap) LayoutOS << ",\n";
            FirstHeap = false;
            unsigned Line = 0;
            std::string FilePath;
            if (CB->getDebugLoc()) {
              Line = CB->getDebugLoc().getLine();
              if (const DILocation *DIL = CB->getDebugLoc().get()) {
                if (DIScope *Scope = DIL->getScope()) {
                  StringRef Dir = Scope->getDirectory();
                  StringRef Filename = Scope->getFilename();
                  if (!Dir.empty())
                    FilePath = (Dir + "/" + Filename).str();
                  else
                    FilePath = Filename.str();
                }
              }
            }
            LayoutOS << "      {\"function\": \"" << escapeJsonString(F.getName().str()) << "\""
                     << ", \"type\": \"" << escapeJsonString(HeapST->getName().str()) << "\""
                     << ", \"size\": " << DL.getTypeAllocSize(HeapST)
                     << ", \"file\": \"" << escapeJsonString(FilePath) << "\""
                     << ", \"line\": " << Line << "}";
          }
        }
      }
      LayoutOS << "\n    ],\n";

      LayoutOS << "    \"stack_vars\": [\n";
      bool FirstStack = true;
      for (Function &F : M) {
        for (BasicBlock &BB : F) {
          for (Instruction &I : BB) {
            auto *AI = dyn_cast<AllocaInst>(&I);
            if (!AI) continue;
            Type *ATy = AI->getAllocatedType();
            if (!isa<StructType>(ATy)) continue;
            auto *ST = cast<StructType>(ATy);
            if (ST->isOpaque() || !ST->hasName()) continue;

            if (!FirstStack) LayoutOS << ",\n";
            FirstStack = false;
            unsigned Line = 0;
            std::string FilePath;
            if (AI->getDebugLoc()) {
              Line = AI->getDebugLoc().getLine();
              if (const DILocation *DIL = AI->getDebugLoc().get()) {
                if (DIScope *Scope = DIL->getScope()) {
                  StringRef Dir = Scope->getDirectory();
                  StringRef Filename = Scope->getFilename();
                  if (!Dir.empty())
                    FilePath = (Dir + "/" + Filename).str();
                  else
                    FilePath = Filename.str();
                }
              }
            }
            LayoutOS << "      {\"function\": \"" << escapeJsonString(F.getName().str()) << "\""
                     << ", \"type\": \"" << escapeJsonString(ST->getName().str()) << "\""
                     << ", \"size\": " << DL.getTypeAllocSize(ST)
                     << ", \"file\": \"" << escapeJsonString(FilePath) << "\""
                     << ", \"line\": " << Line << "}";
          }
        }
      }
      LayoutOS << "\n    ]\n";
      LayoutOS << "  }\n}\n";
    }
  }

  if (FieldAnalysisOnly) {
    return PreservedAnalyses::all();
  }

  FunctionCallee RecordFn = M.getOrInsertFunction(
      "__record_field_access",
      FunctionType::get(Type::getVoidTy(M.getContext()),
                        {Type::getInt32Ty(M.getContext())}, false));

  FunctionCallee RecordFullFn = M.getOrInsertFunction(
      "__record_field_access_full",
      FunctionType::get(Type::getVoidTy(M.getContext()),
                        {Type::getInt32Ty(M.getContext()),
                         PointerType::getUnqual(M.getContext()),
                         Type::getInt32Ty(M.getContext())},
                        false));

  for (auto &IP : InstrumentPoints) {
    Instruction *InsertAt = IP.insert_before;
    if (IP.gep_value && IP.gep_value == IP.insert_before) {
      InsertAt = IP.insert_before->getNextNode();
      if (!InsertAt) InsertAt = IP.insert_before;
    }
    IRBuilder<> Builder(InsertAt);
    if (IP.gep_value) {
      Builder.CreateCall(RecordFullFn,
                         {ConstantInt::get(Type::getInt32Ty(M.getContext()), IP.field_id),
                          IP.gep_value,
                          ConstantInt::get(Type::getInt32Ty(M.getContext()), IP.is_write)});
    } else {
      Builder.CreateCall(
          RecordFn,
          {ConstantInt::get(Type::getInt32Ty(M.getContext()), IP.field_id)});
    }
  }

  return PreservedAnalyses::none();
}

PassPluginLibraryInfo getFieldAnalysisPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "GEPFieldAnalysis", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "field-analysis") {
                    MPM.addPass(GEPFieldAnalysisPass());
                    return true;
                  }
                  return false;
                });
#ifndef LLVM_FIELDANALYSIS_LINK_INTO_TOOLS
            PB.registerOptimizerLastEPCallback(
                [](ModulePassManager &MPM, OptimizationLevel) {
                  MPM.addPass(GEPFieldAnalysisPass());
                });
#endif
          }};
}

#ifdef LLVM_FIELDANALYSIS_LINK_INTO_TOOLS
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getFieldAnalysisPluginInfo();
}
#else
extern "C" ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getFieldAnalysisPluginInfo();
}
#endif