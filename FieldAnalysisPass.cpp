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
#include "llvm/Demangle/Demangle.h"
#include "JsonWriter.h"
#include <map>
#include <string>
#include <optional>
#include <vector>
#include <set>

using namespace llvm;

static cl::opt<bool> FieldAnalysisOnly(
    "field-analysis-only", cl::init(false),
    cl::desc("Only analyze, do not instrument"));

static cl::opt<bool> SimpleAccessRecord(
    "simple-access-record", cl::init(false),
    cl::desc("Only record field_id (no address/region), lightweight affinity-only tracing"));

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
  std::string field_type;
  uint64_t field_size;
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

static Type *getPointedElementType(Value *PtrOp) {
  if (auto *GEP = dyn_cast<GetElementPtrInst>(PtrOp))
    return GEP->getResultElementType();
  if (auto *AI = dyn_cast<AllocaInst>(PtrOp))
    return AI->getAllocatedType();
  if (auto *LI = dyn_cast<LoadInst>(PtrOp))
    return LI->getType();
  return nullptr;
}

static std::string getTBATypeName(Instruction *I) {
  if (!I) return "";
  MDNode *TBAA = I->getMetadata(LLVMContext::MD_tbaa);
  if (!TBAA || TBAA->getNumOperands() < 1) return "";
  auto *TypeNode = dyn_cast<MDNode>(TBAA->getOperand(0));
  if (!TypeNode || TypeNode->getNumOperands() < 1) return "";
  auto *NameMD = dyn_cast<MDString>(TypeNode->getOperand(0));
  if (!NameMD) return "";
  return NameMD->getString().str();
}

static std::string getBasePointerName(Value *GEPV) {
  if (!GEPV)
    return "";

  Value *BasePtr = nullptr;
  if (auto *GEP = dyn_cast<GetElementPtrInst>(GEPV))
    BasePtr = GEP->getPointerOperand();
  else if (auto *CE = dyn_cast<ConstantExpr>(GEPV))
    if (CE->getOpcode() == Instruction::GetElementPtr)
      BasePtr = CE->getOperand(0);

  if (!BasePtr)
    return "";

  while (auto *BC = dyn_cast<BitCastInst>(BasePtr))
    BasePtr = BC->getOperand(0);

  if (auto *GV = dyn_cast<GlobalVariable>(BasePtr)) {
    if (GV->hasName())
      return GV->getName().str();
    return "";
  }

  if (auto *AI = dyn_cast<AllocaInst>(BasePtr)) {
    if (AI->hasName())
      return AI->getName().str();
    return "";
  }

  if (auto *Load = dyn_cast<LoadInst>(BasePtr)) {
    Value *SrcPtr = Load->getPointerOperand();
    while (auto *BC = dyn_cast<BitCastInst>(SrcPtr))
      SrcPtr = BC->getOperand(0);
    if (auto *GV = dyn_cast<GlobalVariable>(SrcPtr)) {
      if (GV->hasName())
        return GV->getName().str();
    } else if (auto *AI = dyn_cast<AllocaInst>(SrcPtr)) {
      if (AI->hasName())
        return AI->getName().str();
    }
  }

  return "";
}

static const std::map<std::string, uint64_t> SCALAR_SIZES = {
    {"float", 4}, {"double", 8}, {"i8", 1}, {"i16", 2},
    {"i32", 4}, {"i64", 8}, {"ptr", 8}
};

static std::optional<FieldInfo> createScalarFieldInfo(
    Value *PtrOp, Instruction *UserInst,
    const DataLayout &DL,
    std::map<std::pair<std::string, uint32_t>, uint32_t> &FieldIdMap,
    uint32_t &NextFieldId) {

  std::string TypeName;

  Type *ElemTy = getPointedElementType(PtrOp);
  if (ElemTy) {
    if (ElemTy->isFloatTy())       TypeName = "float";
    else if (ElemTy->isDoubleTy()) TypeName = "double";
    else if (ElemTy->isIntegerTy(8))  TypeName = "i8";
    else if (ElemTy->isIntegerTy(16)) TypeName = "i16";
    else if (ElemTy->isIntegerTy(32)) TypeName = "i32";
    else if (ElemTy->isIntegerTy(64)) TypeName = "i64";
    else if (ElemTy->isPointerTy())   TypeName = "ptr";
    else {
      std::string Tmp;
      raw_string_ostream SS(Tmp);
      ElemTy->print(SS);
      TypeName = std::move(Tmp);
    }
  }

  if (TypeName.empty())
    TypeName = getTBATypeName(UserInst);

  if (TypeName.empty())
    TypeName = "unknown";

  if (TypeName == "omnipotent char" || TypeName == "p__IO_FILE")
    return std::nullopt;

  std::string BaseName = getBasePointerName(PtrOp);
  std::string StructName;
  if (!BaseName.empty())
    StructName = (Twine("scalar.") + TypeName + "." + BaseName).str();
  else
    StructName = (Twine("scalar.") + TypeName).str();
  uint32_t FieldIdx = 0;
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
  Info.byte_offset = 0;
  Info.field_id = FieldId;
  Info.field_type = TypeName;
  Info.field_size = SCALAR_SIZES.count(TypeName) ? SCALAR_SIZES.at(TypeName) : 0;
  Info.access_path = {{StructName, FieldIdx, 0}};
  Info.source_file = "";
  Info.source_line = 0;
  Info.source_col = 0;

  if (UserInst && UserInst->getDebugLoc()) {
    const DebugLoc &DLoc = UserInst->getDebugLoc();
    Info.source_line = DLoc.getLine();
    Info.source_col = DLoc.getCol();
    if (auto *Scope = dyn_cast<DIScope>(DLoc.getScope())) {
      Info.source_file = Scope->getFilename().str();
    }
  } else if (auto *GEPI = dyn_cast<GetElementPtrInst>(PtrOp)) {
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
    std::string Stripped = stripPrefix(Name, "struct.");
    if (Stripped.empty())
      Stripped = stripPrefix(Name, "class.");
    if (Stripped == TBAA)
      return ST;

    std::string Demangled = llvm::demangle(TBAA);
    if (!Demangled.empty() && Demangled != TBAA) {
      const char *TInfoPrefix = "typeinfo name for ";
      if (Demangled.compare(0, strlen(TInfoPrefix), TInfoPrefix) == 0)
        Demangled = Demangled.substr(strlen(TInfoPrefix));
      else {
        const char *TInfoPrefix2 = "typeinfo for ";
        if (Demangled.compare(0, strlen(TInfoPrefix2), TInfoPrefix2) == 0)
          Demangled = Demangled.substr(strlen(TInfoPrefix2));
      }
      if (Stripped == Demangled)
        return ST;
      if (Name == Demangled)
        return ST;
    }
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

static std::string getTBAAFieldTypeName(MDNode *FieldTypeNode) {
  if (!FieldTypeNode || FieldTypeNode->getNumOperands() < 1)
    return "?";
  auto *TypeNameMD =
      dyn_cast_or_null<MDString>(FieldTypeNode->getOperand(0));
  if (!TypeNameMD)
    return "?";
  std::string Name = TypeNameMD->getString().str();
  if (Name == "omnipotent char")
    return "i8";
  std::string Demangled = llvm::demangle(Name);
  if (!Demangled.empty() && Demangled != Name) {
    const char *TInfoPrefix = "typeinfo name for ";
    if (Demangled.compare(0, strlen(TInfoPrefix), TInfoPrefix) == 0)
      Demangled = Demangled.substr(strlen(TInfoPrefix));
    else {
      const char *TInfoPrefix2 = "typeinfo for ";
      if (Demangled.compare(0, strlen(TInfoPrefix2), TInfoPrefix2) == 0)
        Demangled = Demangled.substr(strlen(TInfoPrefix2));
    }
    if (!Demangled.empty() && Demangled != Name)
      return Demangled;
  }
  return Name;
}

static uint64_t getTBAAFieldTypeSize(const std::string &TypeName,
                                      const DataLayout &DL) {
  if (TypeName == "int" || TypeName == "unsigned int" || TypeName == "i32")
    return 4;
  if (TypeName == "long" || TypeName == "unsigned long" || TypeName == "i64")
    return 8;
  if (TypeName == "short" || TypeName == "unsigned short" || TypeName == "i16")
    return 2;
  if (TypeName == "char" || TypeName == "unsigned char" || TypeName == "i8")
    return 1;
  if (TypeName == "float")
    return 4;
  if (TypeName == "double")
    return 8;
  if (TypeName == "long double")
    return 16;
  if (TypeName == "bool")
    return 1;
  if (TypeName.find('*') != std::string::npos || TypeName == "ptr")
    return DL.getPointerSize();
  return 0;
}

static bool buildAccessPathFromTBAAStruct(
    MDNode *StructTypeNode, uint64_t Offset, const DataLayout &DL,
    std::vector<AccessStep> &Path,
    std::string &LeafStructName, uint32_t &LeafFieldIdx,
    uint64_t &LeafTotalOffset) {

  if (!StructTypeNode || StructTypeNode->getNumOperands() < 1)
    return false;

  auto *NameMD = dyn_cast_or_null<MDString>(StructTypeNode->getOperand(0));
  if (!NameMD)
    return false;
  std::string StructName = NameMD->getString().str();

  std::string Demangled = llvm::demangle(StructName);
  if (!Demangled.empty() && Demangled != StructName) {
    const char *TInfoPrefix = "typeinfo name for ";
    if (Demangled.compare(0, strlen(TInfoPrefix), TInfoPrefix) == 0)
      Demangled = Demangled.substr(strlen(TInfoPrefix));
    else {
      const char *TInfoPrefix2 = "typeinfo for ";
      if (Demangled.compare(0, strlen(TInfoPrefix2), TInfoPrefix2) == 0)
        Demangled = Demangled.substr(strlen(TInfoPrefix2));
    }
    if (!Demangled.empty() && Demangled != StructName)
      StructName = Demangled;
  }

  unsigned NumOperands = StructTypeNode->getNumOperands();
  unsigned NumFields = (NumOperands - 1) / 2;
  if (NumFields < 2)
    return false;

  for (unsigned i = 0; i < NumFields; ++i) {
    unsigned TypeIdx = 1 + i * 2;
    unsigned OffsetIdx = 1 + i * 2 + 1;
    if (OffsetIdx >= NumOperands)
      return false;

    auto *FieldOffsetMD =
        dyn_cast_or_null<ConstantAsMetadata>(StructTypeNode->getOperand(OffsetIdx));
    if (!FieldOffsetMD)
      return false;
    uint64_t FieldOffset =
        cast<ConstantInt>(FieldOffsetMD->getValue())->getZExtValue();

    uint64_t FieldEnd = 0;
    if (i + 1 < NumFields) {
      unsigned NextOffsetIdx = 1 + (i + 1) * 2 + 1;
      if (NextOffsetIdx < NumOperands) {
        if (auto *NextOffMD =
                dyn_cast_or_null<ConstantAsMetadata>(StructTypeNode->getOperand(NextOffsetIdx))) {
          FieldEnd = cast<ConstantInt>(NextOffMD->getValue())->getZExtValue();
        }
      }
    }
    if (FieldEnd == 0) {
      FieldEnd = FieldOffset + 8;
    }

    if (Offset >= FieldOffset && Offset < FieldEnd) {
      AccessStep Step;
      Step.struct_name = StructName;
      Step.field_idx = i;
      Step.field_offset = FieldOffset;
      Path.push_back(Step);

      auto *FieldTypeNode =
          dyn_cast_or_null<MDNode>(StructTypeNode->getOperand(TypeIdx));
      if (FieldTypeNode && FieldTypeNode->getNumOperands() >= 1) {
        if (auto *SubNameMD =
                dyn_cast_or_null<MDString>(FieldTypeNode->getOperand(0))) {
          std::string SubName = SubNameMD->getString().str();
          if (SubName.find("_ZTS") == 0 || SubName.find("_ZTI") == 0) {
            uint64_t SubOffset = Offset - FieldOffset;
            return buildAccessPathFromTBAAStruct(
                FieldTypeNode, SubOffset, DL, Path,
                LeafStructName, LeafFieldIdx, LeafTotalOffset);
          }
        }
      }

      LeafStructName = StructName;
      LeafFieldIdx = i;
      LeafTotalOffset = Offset;
      return true;
    }
  }

  return false;
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

  std::vector<AccessStep> AccessPath;
  std::string LeafStructName;
  uint32_t LeafFieldIdx = 0;
  uint64_t LeafTotalOffset = 0;

  if (BaseST) {
    StructType *LeafStruct = nullptr;
    if (!buildAccessPathRecursive(BaseST, FieldOffset, DL, AccessPath,
                                  LeafStruct, LeafFieldIdx, LeafTotalOffset)) {
      return std::nullopt;
    }
    LeafStructName = LeafStruct->getName().str();
  } else {
    if (!buildAccessPathFromTBAAStruct(BaseTypeNode, FieldOffset, DL,
                                       AccessPath, LeafStructName,
                                       LeafFieldIdx, LeafTotalOffset)) {
      return std::nullopt;
    }
  }

  uint64_t gep_byte_offset = FieldOffset;
  if (auto *GEPOp = dyn_cast<GEPOperator>(GEPV)) {
    APInt AccOffset(DL.getIndexTypeSizeInBits(GEPOp->getType()), 0);
    if (GEPOp->accumulateConstantOffset(DL, AccOffset))
      gep_byte_offset = AccOffset.getZExtValue();
  }

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

  if (BaseST) {
    Type *FieldTy = BaseST->getElementType(LeafFieldIdx);
    if (FieldTy->isPointerTy()) {
      Info.field_type = "ptr";
      Info.field_size = DL.getPointerSize();
    } else if (FieldTy->isIntegerTy()) {
      Info.field_type = "i" + std::to_string(FieldTy->getIntegerBitWidth());
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (FieldTy->isFloatingPointTy()) {
      Info.field_type = FieldTy->isDoubleTy() ? "double" : "float";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (auto *NestedST = dyn_cast<StructType>(FieldTy)) {
      Info.field_type = NestedST->getName().str();
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else {
      Info.field_type = "?";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    }
  } else {
    MDNode *FieldTypeNode = nullptr;
    unsigned NumOps = BaseTypeNode->getNumOperands();
    unsigned TypeIdx = 1 + LeafFieldIdx * 2;
    if (TypeIdx < NumOps)
      FieldTypeNode = dyn_cast_or_null<MDNode>(BaseTypeNode->getOperand(TypeIdx));
    Info.field_type = getTBAAFieldTypeName(FieldTypeNode);
    Info.field_size = getTBAAFieldTypeSize(Info.field_type, DL);
  }
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
      if (FieldIdx >= ST->getNumElements())
        return std::nullopt;
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

      if (isa<StructType>(CurTy)) {
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
  {
    Type *FieldTy = LeafStruct->getElementType(LeafFieldIdx);
    if (FieldTy->isPointerTy()) {
      Info.field_type = "ptr";
      Info.field_size = DL.getPointerSize();
    } else if (FieldTy->isIntegerTy()) {
      Info.field_type = "i" + std::to_string(FieldTy->getIntegerBitWidth());
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (FieldTy->isFloatingPointTy()) {
      Info.field_type = FieldTy->isDoubleTy() ? "double" : "float";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (auto *NestedST = dyn_cast<StructType>(FieldTy)) {
      Info.field_type = NestedST->getName().str();
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else {
      Info.field_type = "?";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    }
  }
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
      if (CI->getZExtValue() >= ST->getNumElements())
        break;
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
  } else if (auto *CI = dyn_cast<CallBase>(PtrOp)) {
    ST = dyn_cast<StructType>(CI->getType());
    if (!ST) {
      for (User *U : CI->users()) {
        if (auto *UI = dyn_cast<Instruction>(U)) {
          if (MDNode *TBAA = UI->getMetadata(LLVMContext::MD_tbaa)) {
            if (TBAA->getNumOperands() >= 1) {
              if (auto *BaseMD = dyn_cast<MDNode>(TBAA->getOperand(0))) {
                if (BaseMD->getNumOperands() >= 1) {
                  if (auto *NameMD = dyn_cast<MDString>(BaseMD->getOperand(0))) {
                    ST = findStructTypeInModule(M, NameMD->getString().str());
                    if (ST) break;
                  }
                }
              }
            }
          }
        }
      }
    }
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
  {
    Type *FieldTy = ST->getElementType(FieldIdx);
    if (FieldTy->isPointerTy()) {
      Info.field_type = "ptr";
      Info.field_size = DL.getPointerSize();
    } else if (FieldTy->isIntegerTy()) {
      Info.field_type = "i" + std::to_string(FieldTy->getIntegerBitWidth());
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (FieldTy->isFloatingPointTy()) {
      Info.field_type = FieldTy->isDoubleTy() ? "double" : "float";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else if (auto *NestedST = dyn_cast<StructType>(FieldTy)) {
      Info.field_type = NestedST->getName().str();
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    } else {
      Info.field_type = "?";
      Info.field_size = DL.getTypeAllocSize(FieldTy);
    }
  }
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

struct GEPRecord {
  std::string map_key;
  FieldInfo info;
};

static void writeFieldMapJson(const std::vector<GEPRecord> &Records,
                               raw_ostream &OS) {
  JsonWriter W(OS);
  W.beginObject();
  for (const auto &Rec : Records) {
    W.key(Rec.map_key);
    W.beginObject();
    W.key("struct").value(Rec.info.struct_name);
    W.key("field").value(Rec.info.field_idx);
    W.key("offset").value(Rec.info.byte_offset);
    W.key("id").value(Rec.info.field_id);
    W.key("field_type").value(Rec.info.field_type);
    W.key("field_size").value(Rec.info.field_size);

    W.key("source");
    W.beginObject();
    W.key("file").value(Rec.info.source_file);
    W.key("line").value(Rec.info.source_line);
    W.key("col").value(Rec.info.source_col);
    W.endObject();

    W.key("access_path");
    W.beginArray();
    for (const auto &Step : Rec.info.access_path) {
      W.beginObject();
      W.key("struct").value(Step.struct_name);
      W.key("field").value(Step.field_idx);
      W.key("field_offset").value(Step.field_offset);
      W.endObject();
    }
    W.endArray();

    W.endObject();
  }
  W.endObject();
}

static void writeStructLayoutJson(Module &M, const DataLayout &DL,
                                   raw_ostream &OS) {
  JsonWriter W(OS);
  W.beginObject();

  W.key("structs");
  W.beginObject();
  for (StructType *ST : M.getIdentifiedStructTypes()) {
    if (ST->isOpaque() || !ST->hasName())
      continue;
    W.key(ST->getName().str());
    W.beginObject();
    W.key("size").value(DL.getTypeAllocSize(ST));

    W.key("fields");
    W.beginArray();
    const StructLayout *SL = DL.getStructLayout(ST);
    for (unsigned i = 0; i < ST->getNumElements(); ++i) {
      W.beginObject();
      W.key("idx").value(i);
      Type *ET = ST->getElementType(i);
      std::string TypeStr;
      raw_string_ostream TSS(TypeStr);
      ET->print(TSS);
      W.key("type").value(TSS.str());
      W.key("offset").value(SL->getElementOffset(i));
      W.key("size").value(DL.getTypeAllocSize(ET));
      W.endObject();
    }
    W.endArray();

    W.endObject();
  }
  W.endObject();

  W.key("variables");
  W.beginObject();

  W.key("global");
  W.beginArray();
  for (GlobalVariable &GV : M.globals()) {
    Type *Ty = GV.getValueType();
    if (!isa<StructType>(Ty))
      continue;
    auto *ST = cast<StructType>(Ty);
    if (ST->isOpaque() || !ST->hasName())
      continue;
    W.beginObject();
    W.key("name").value(GV.getName().str());
    W.key("type").value(ST->getName().str());
    W.key("size").value(DL.getTypeAllocSize(ST));
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
    W.key("file").value(FilePath);
    W.key("line").value(Line);
    W.endObject();
  }
  W.endArray();

  W.key("heap_sites");
  W.beginArray();
  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        auto *CB = dyn_cast<CallBase>(&I);
        if (!CB)
          continue;
        StringRef Callee =
            CB->getCalledFunction() ? CB->getCalledFunction()->getName() : "";
        if (Callee != "malloc" && Callee != "calloc" && Callee != "realloc")
          continue;

        StructType *HeapST = nullptr;
        for (User *U : CB->users()) {
          if (auto *UI = dyn_cast<Instruction>(U)) {
            if (MDNode *TBAA = UI->getMetadata(LLVMContext::MD_tbaa)) {
              if (TBAA->getNumOperands() >= 1) {
                if (auto *BaseMD = dyn_cast<MDNode>(TBAA->getOperand(0))) {
                  if (BaseMD->getNumOperands() >= 1) {
                    if (auto *NameMD =
                            dyn_cast<MDString>(BaseMD->getOperand(0))) {
                      HeapST = findStructTypeInModule(
                          M, NameMD->getString().str());
                      break;
                    }
                  }
                }
              }
            }
          }
        }
        if (!HeapST)
          continue;

        W.beginObject();
        W.key("function").value(F.getName().str());
        W.key("type").value(HeapST->getName().str());
        W.key("size").value(DL.getTypeAllocSize(HeapST));
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
        W.key("file").value(FilePath);
        W.key("line").value(Line);
        W.endObject();
      }
    }
  }
  W.endArray();

  W.key("stack_vars");
  W.beginArray();
  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        auto *AI = dyn_cast<AllocaInst>(&I);
        if (!AI)
          continue;
        Type *ATy = AI->getAllocatedType();
        if (!isa<StructType>(ATy))
          continue;
        auto *ST = cast<StructType>(ATy);
        if (ST->isOpaque() || !ST->hasName())
          continue;

        W.beginObject();
        W.key("function").value(F.getName().str());
        W.key("type").value(ST->getName().str());
        W.key("size").value(DL.getTypeAllocSize(ST));
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
        W.key("file").value(FilePath);
        W.key("line").value(Line);
        W.endObject();
      }
    }
  }
  W.endArray();

  W.endObject();
  W.endObject();
}

PreservedAnalyses GEPFieldAnalysisPass::run(Module &M,
                                            ModuleAnalysisManager &MAM) {
  if (M.getNamedMetadata("fieldanalysis.instrumented"))
    return PreservedAnalyses::all();

  M.getOrInsertNamedMetadata("fieldanalysis.instrumented");

  if (M.getIdentifiedStructTypes().empty())
    return PreservedAnalyses::all();

  const DataLayout &DL = M.getDataLayout();
  std::map<std::pair<std::string, uint32_t>, uint32_t> FieldIdMap;
  uint32_t NextFieldId = 0;

  std::vector<GEPRecord> Records;
  std::vector<InstrumentPoint> InstrumentPoints;
  std::set<std::pair<Instruction*, uint32_t>> InstrumentedPairs;

  for (Function &F : M) {
    if (F.isDeclaration())
      continue;
    std::set<Value *> ProcessedGEPs;
    unsigned BBIdx = 0;

    for (BasicBlock &BB : F) {
      unsigned InstIdx = 0;

      for (Instruction &I : BB) {
        if (auto *CB = dyn_cast<CallBase>(&I)) {
          if (auto *CF = CB->getCalledFunction()) {
            StringRef FName = CF->getName();
            if (FName == "__record_field_access_full" ||
                FName == "__record_field_access") {
              ++InstIdx;
              continue;
            }
          }
        }

        if (isa<PHINode>(&I)) {
          ++InstIdx;
          continue;
        }

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
          if (!Info) {
            Info = createScalarFieldInfo(V, UserInst, DL,
                                         FieldIdMap, NextFieldId);
            if (!Info)
              continue;
          }

          ProcessedGEPs.insert(V);
          uint32_t Fid = Info->field_id;

          std::string MapKey;
          if (isa<GetElementPtrInst>(V)) {
            MapKey = (Twine(F.getName()) + "::" + Twine(BBIdx) + "::" +
                      Twine(InstIdx) + "_gep")
                         .str();
          } else {
            MapKey = (Twine(F.getName()) + "::" + Twine(BBIdx) + "::" +
                      Twine(InstIdx) + "_constexpr")
                         .str();
          }

          Records.push_back({MapKey, std::move(*Info)});

          int rw_flag = isa<StoreInst>(&I) ? 1 :
                        isa<LoadInst>(&I) ? 0 :
                        isa<MemCpyInst>(&I) || isa<MemSetInst>(&I) ? 2 : 0;
          auto IPKey = std::make_pair(&I, Fid);
          if (InstrumentedPairs.count(IPKey))
            continue;
          InstrumentedPairs.insert(IPKey);
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
          if (!Info) {
            Info = createScalarFieldInfo(GEP, GEP, DL,
                                         FieldIdMap, NextFieldId);
          }
          if (Info) {
            ProcessedGEPs.insert(GEP);
            uint32_t Fid = Info->field_id;

            std::string MapKey = (Twine(F.getName()) + "::" + Twine(BBIdx) +
                                  "::" + Twine(InstIdx) + "_standalone")
                                     .str();

            Records.push_back({MapKey, std::move(*Info)});

            int default_rw = 0;
            for (User *U : GEP->users()) {
              if (isa<StoreInst>(U)) { default_rw = 1; break; }
              if (isa<MemCpyInst>(U)) { default_rw = 2; break; }
            }
            Instruction *ActualInsertAt = GEP->getNextNode() ? GEP->getNextNode() : GEP;
            auto IPKey = std::make_pair(ActualInsertAt, Fid);
            if (InstrumentedPairs.count(IPKey)) {
              ++InstIdx;
              continue;
            }
            InstrumentedPairs.insert(IPKey);
            InstrumentPoints.push_back({GEP, Fid, GEP, default_rw});
          }
        }

        if (!HitGEP && HasTBAA) {
          Value *PtrOp = nullptr;
          if (auto *SI = dyn_cast<StoreInst>(&I))
            PtrOp = SI->getPointerOperand();
          else if (auto *LI = dyn_cast<LoadInst>(&I))
            PtrOp = LI->getPointerOperand();

          if (PtrOp && !isGEPValue(PtrOp)) {
            auto Info = analyzeGEP(PtrOp, &I, DL, M, FieldIdMap, NextFieldId);
            if (!Info) {
              Info = createScalarFieldInfo(PtrOp, &I, DL,
                                           FieldIdMap, NextFieldId);
            }
            if (Info) {
              uint32_t Fid = Info->field_id;

              std::string MapKey = (Twine(F.getName()) + "::" + Twine(BBIdx) +
                                    "::" + Twine(InstIdx) + "_direct")
                                       .str();
              Records.push_back({MapKey, std::move(*Info)});

              int rw_flag = isa<StoreInst>(&I) ? 1 : 0;

              Value *ArgGEP = SimpleAccessRecord ? nullptr : PtrOp;
              auto IPKey = std::make_pair(&I, Fid);
              if (InstrumentedPairs.count(IPKey)) {
                ++InstIdx;
                continue;
              }
              InstrumentedPairs.insert(IPKey);
              InstrumentPoints.push_back({&I, Fid, ArgGEP, rw_flag});
            }
          }
        }

        ++InstIdx;
      }
      ++BBIdx;
    }
  }

  {
    std::error_code EC;
    raw_fd_ostream OS("gep_field_map.json", EC, sys::fs::OF_Text);
    if (!EC) {
      writeFieldMapJson(Records, OS);
    }
  }

  {
    std::error_code EC2;
    raw_fd_ostream LayoutOS("struct_layout.json", EC2, sys::fs::OF_Text);
    if (!EC2) {
      writeStructLayoutJson(M, DL, LayoutOS);
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
    }
    IRBuilder<> Builder(InsertAt);
    if (!InsertAt)
      Builder.SetInsertPoint(IP.insert_before->getParent());
    if (IP.gep_value && !SimpleAccessRecord) {
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