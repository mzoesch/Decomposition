# CMakeLists.txt for some test examples for the Decomposition plugin.

cmake_minimum_required(VERSION 3.13)

project(SingleHeaderRepository VERSION 1.0 LANGUAGES C)

add_library(MyLibrary STATIC
    @HEADER_FILE@
    Translation.c
    )
