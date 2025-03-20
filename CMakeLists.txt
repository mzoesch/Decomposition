cmake_minimum_required(VERSION 3.13)

if(NOT DEFINED CMAKE_C_COMPILER)
  set(CMAKE_C_COMPILER "clang")
endif()
if(NOT DEFINED CMAKE_CXX_COMPILER)
  set(CMAKE_CXX_COMPILER "clang++")
endif()

string(REGEX MATCH ".*clang.*" REGREX_MATCHED ${CMAKE_C_COMPILER})
if(NOT REGREX_MATCHED)
    message(FATAL_ERROR "C compiler [Clang] is required, found: [${CMAKE_C_COMPILER}].")
endif()
string(REGEX MATCH ".*clang\\+\\+.*" REGREX_MATCHED ${CMAKE_CXX_COMPILER})
if(NOT REGREX_MATCHED)
    message(FATAL_ERROR "CXX compiler [Clang++] is required, found: [${CMAKE_CXX_COMPILER}].")
endif()

project(Decomposition VERSION 1.0 LANGUAGES C CXX)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

file(GLOB_RECURSE SOURCES
        "Source/*.cpp"
        "Source/*.h"
    )
add_llvm_library(DecompositionPass MODULE ${SOURCES})

set_target_properties(DecompositionPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    )
