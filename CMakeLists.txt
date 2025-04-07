# CMakeLists.txt for the pass plugin for LLVM.

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
find_package(Clang REQUIRED CONFIG)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)


# /*----------------------------------------------------------------------------
#     DecompositionPass.
# ----------------------------------------------------------------------------*/
add_llvm_library(DecompositionPass MODULE
    Source/Llvm/Launch.cpp
    Source/Llvm/Shared.cpp
    Source/Llvm/SccPass.cpp
    Source/Llvm/ModPass.cpp
    Source/Llvm/Out.cpp
    )
set_target_properties(DecompositionPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Llvm"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Llvm"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Llvm"
    )
target_compile_definitions(DecompositionPass PRIVATE
    DCP_API=PRIVATE_DCP_EXPORT
    )
target_include_directories(DecompositionPass PRIVATE
    Source/Shared
    )


# /*----------------------------------------------------------------------------
#     DecompositionPreprocessorPass.
# ----------------------------------------------------------------------------*/
add_library(DecompositionPreprocessorPass MODULE
    Source/Clang/Launch.cpp
    Source/Clang/MyConsumer.cpp
    Source/Clang/Out.cpp
    )
set_target_properties(DecompositionPreprocessorPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    )
target_include_directories(DecompositionPreprocessorPass PRIVATE ${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})
target_compile_definitions(DecompositionPreprocessorPass PRIVATE
    PREDCP_API=PRIVATE_PREDCP_EXPORT
    )
target_include_directories(DecompositionPreprocessorPass PRIVATE
    Source/Shared
    )
