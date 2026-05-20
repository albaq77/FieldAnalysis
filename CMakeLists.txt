cmake_minimum_required(VERSION 3.16)
project(FieldAnalysisPlugin)

find_package(LLVM REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

llvm_map_components_to_libnames(llvm_libs core support analysis passes transformutils irreader)

add_library(FieldAnalysisPlugin MODULE FieldAnalysisPass.cpp)
target_link_libraries(FieldAnalysisPlugin ${llvm_libs})
target_link_options(FieldAnalysisPlugin PRIVATE -Wl,-Bsymbolic)

set_target_properties(FieldAnalysisPlugin PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
    OUTPUT_NAME "FieldAnalysis"
    PREFIX ""
)

add_subdirectory(runtime)
