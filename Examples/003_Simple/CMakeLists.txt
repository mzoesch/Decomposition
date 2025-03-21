cmake_minimum_required(VERSION 3.21...3.30)

find_package(Python REQUIRED COMPONENTS Interpreter)
message(STATUS "Python_EXECUTABLE: ${Python_EXECUTABLE}")

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

if(NOT DEFINED DECOMPOSITION_PASS_ROOT)
    message(FATAL_ERROR "DECOMPOSITION_PASS_ROOT is not defined.")
endif()
message(STATUS "DECOMPOSITION_PASS_ROOT: ${DECOMPOSITION_PASS_ROOT}")

project(
    Example_Simple
    LANGUAGES C
    )

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -emit-llvm -S")

set(CUR_MODULE "ESimple")
add_executable(${CUR_MODULE} main.c)
set_target_properties(${CUR_MODULE} PROPERTIES
        COMPILE_FLAGS "-O0 -disable-llvm-passes -Xclang -disable-O0-optnone"
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    )
add_custom_command(TARGET ${CUR_MODULE} POST_BUILD
    COMMAND ${Python_EXECUTABLE} ${DECOMPOSITION_PASS_ROOT}/compiler_helper.py --Intermediate ${CMAKE_CURRENT_BINARY_DIR} --Source ${CMAKE_SOURCE_DIR} --Module ${CUR_MODULE}
    )
