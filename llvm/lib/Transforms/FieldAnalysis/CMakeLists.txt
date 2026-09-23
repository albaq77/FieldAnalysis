get_filename_component(_fa_default "${CMAKE_CURRENT_SOURCE_DIR}/../../../.." ABSOLUTE)
set(FIELDANALYSIS_SOURCE_DIR "${_fa_default}" CACHE PATH "Canonical FieldAnalysis source directory")
if(NOT EXISTS "${FIELDANALYSIS_SOURCE_DIR}/FieldAnalysisPass.cpp")
  message(FATAL_ERROR "Set FIELDANALYSIS_SOURCE_DIR to the standalone FieldAnalysis directory")
endif()
add_llvm_pass_plugin(FieldAnalysis
  "${FIELDANALYSIS_SOURCE_DIR}/FieldAnalysisPass.cpp"
  DEPENDS intrinsics_gen
  LINK_COMPONENTS Analysis Core Support TransformUtils)
