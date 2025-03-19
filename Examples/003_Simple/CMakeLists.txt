cmake_minimum_required(VERSION 3.21...3.30)

set(CMAKE_C_COMPILER clang)

set(LLVM_MODE "LL" CACHE STRING "LLVM out mode: MC, LL or BC.")

project(
    Example_Simple
    LANGUAGES C
    )

set(CMAKE_C_STANDARD 23)

if(LLVM_MODE STREQUAL "MC")
    message(STATUS "LLVM_MODE: MC")
    # Default. Do nothing
elseif(LLVM_MODE STREQUAL "LL")
    message(STATUS "LLVM_MODE: MC")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -emit-llvm -S") # => .ll
elseif(LLVM_MODE STREQUAL "BC")
    message(STATUS "LLVM_MODE: MC")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -emit-llvm -c") # => .bc
else()
    message(FATAL_ERROR "Invalid LLVM_MODE: ${LLVM_MODE}.")
endif()

add_executable(ESimple main.c)
set_target_properties(ESimple PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Binaries"
    )
