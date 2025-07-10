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

find_package(Clang REQUIRED CONFIG)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

# /*----------------------------------------------------------------------------
#     Decomposition Plugin.
# ----------------------------------------------------------------------------*/
add_library(Decomposition MODULE
    Source/Clang/Launch.cpp
    Source/Clang/Consumer.cpp
    Source/Clang/Visitor.cpp
    Source/Clang/Collectors.cpp
    Source/Clang/Fwd.cpp
    Source/Clang/Out.cpp
    Source/Clang/Symbols.cpp
    )
set_target_properties(Decomposition PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries/Clang"
    )
target_include_directories(Decomposition PRIVATE ${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})
target_compile_definitions(Decomposition PRIVATE
    DCP_API=PRIVATE_DCP_EXPORT
    )
target_include_directories(Decomposition PRIVATE
    Source/Vendor
    )

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Adding debug flags for Decomposition plugin.")
    target_compile_options(Decomposition PRIVATE
        -g
        -O0
        )
    target_compile_definitions(Decomposition PRIVATE
        DCP_IN_DEBUG=1
        )
else()
    message(STATUS "Adding release flags for Decomposition plugin.")
    target_compile_options(Decomposition PRIVATE
        -O3
        )
    target_compile_definitions(Decomposition PRIVATE
        DCP_IN_DEBUG=0
        )
endif()

option(
    DCP_DO_OUT_CHECKS
    "Enable output checks in Decomposition plugin."
    "OFF"
    )
option(
    DCP_WITH_GDB_LINUX
    "Enable GDB support for Linux in Decomposition plugin."
    "OFF"
    )

if(DCP_DO_OUT_CHECKS)
    message(STATUS "Output checks enabled for Decomposition plugin.")
    target_compile_definitions(Decomposition PRIVATE
        DCP_DO_OUT_CHECKS=1
        )
else()
    message(STATUS "Output checks disabled for Decomposition plugin.")
    target_compile_definitions(Decomposition PRIVATE
        DCP_DO_OUT_CHECKS=0
        )
endif()
if(DCP_WITH_GDB_LINUX)
    message(STATUS "GDB support enabled for Linux in Decomposition plugin.")
    target_compile_definitions(Decomposition PRIVATE
        DCP_WITH_GDB_LINUX=1
        )
else()
    message(STATUS "GDB support disabled for Linux in Decomposition plugin.")
    target_compile_definitions(Decomposition PRIVATE
        DCP_WITH_GDB_LINUX=0
        )
endif()
