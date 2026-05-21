add_llvm_pass_plugin(FieldAnalysis
  FieldAnalysis.cpp

  DEPENDS
  intrinsics_gen

  LINK_COMPONENTS
  Analysis
  Core
  Support
  TransformUtils
  )
