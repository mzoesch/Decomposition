cmake_minimum_required(VERSION 3.21...3.30)

#set(CMAKE_VERBOSE_MAKEFILE ON)

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

if(NOT DEFINED ClANG_PLUGIN_PATH)
    set(ClANG_PLUGIN_PATH "${DECOMPOSITION_PASS_ROOT}/Binaries/Clang/libDecompositionPreprocessorPass.so")
endif ()
message(STATUS "ClANG_PLUGIN_PATH: ${ClANG_PLUGIN_PATH}")

set(MY_FILES
    main.c
    Private/mymath.c
    Private/mystate.c
    )

set(CUR_MODULE "Simple")
add_executable(${CUR_MODULE} ${MY_FILES})
set_target_properties(${CUR_MODULE} PROPERTIES
        COMPILE_FLAGS "-O0 -g -disable-llvm-passes -Xclang -disable-O0-optnone"
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
)
target_include_directories(${CUR_MODULE} PRIVATE ${CMAKE_SOURCE_DIR})

set(CUR_MODULE "SimpleToIr")
add_executable(${CUR_MODULE} ${MY_FILES})
set_target_properties(${CUR_MODULE} PROPERTIES
    LINKER_LANGUAGE NONE
    COMPILE_FLAGS "-emit-llvm -S -O0 -g -disable-llvm-passes -Xclang -disable-O0-optnone"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    )
target_include_directories(${CUR_MODULE} PRIVATE ${CMAKE_SOURCE_DIR})
add_custom_command(TARGET ${CUR_MODULE} POST_BUILD
    COMMAND ${Python_EXECUTABLE} ${DECOMPOSITION_PASS_ROOT}/Source/Python/compiler_helper.py --Intermediate ${CMAKE_CURRENT_BINARY_DIR} --Source ${CMAKE_SOURCE_DIR} --Module ${CUR_MODULE}
    )

set(CUR_MODULE "SimpleWithPlugin")
add_executable(${CUR_MODULE} ${MY_FILES})
set_target_properties(${CUR_MODULE} PROPERTIES
    LINKER_LANGUAGE NONE
    COMPILE_FLAGS "-emit-llvm -S -O0 -g -disable-llvm-passes -Xclang -disable-O0-optnone -Xclang -load -Xclang ${ClANG_PLUGIN_PATH} -dcp-root ${DECOMPOSITION_PASS_ROOT} -Xclang -plugin -Xclang decomposition-plugin-preprocessor"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    )
target_include_directories(${CUR_MODULE} PRIVATE ${CMAKE_SOURCE_DIR})
