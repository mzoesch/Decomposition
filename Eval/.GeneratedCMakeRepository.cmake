# CMakeLists.txt for some test examples for the Decomposition plugin.

cmake_minimum_required(VERSION 3.13)

project(GeneratedCMakeRepository VERSION 1.0 LANGUAGES C)

add_library(MyLibrary STATIC
    @SOURCES@
    )

target_include_directories(MyLibrary PUBLIC
    @PUB_INCLUDES@
    )

target_compile_definitions(MyLibrary PUBLIC
    @PUB_COMPILE_DEFS@
    )
