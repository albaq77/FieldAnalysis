add_library(affinity STATIC libaffinity.c)
target_include_directories(affinity PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
