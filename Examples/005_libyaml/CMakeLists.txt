
cmake_minimum_required(VERSION 3.5)
project (yaml C)

set(CMAKE_C_COMPILER "clang")
find_package(Python REQUIRED COMPONENTS Interpreter)
message(STATUS "Python_EXECUTABLE: ${Python_EXECUTABLE}")

set (YAML_VERSION_MAJOR 0)
set (YAML_VERSION_MINOR 2)
set (YAML_VERSION_PATCH 5)
set (YAML_VERSION_STRING "${YAML_VERSION_MAJOR}.${YAML_VERSION_MINOR}.${YAML_VERSION_PATCH}")

option(BUILD_SHARED_LIBS "Build libyaml as a shared library" OFF)
set(YAML_STATIC_LIB_NAME "yaml" CACHE STRING "Base name of static library output")

#
# Output directories for a build tree
#
if(NOT DEFINED CMAKE_RUNTIME_OUTPUT_DIRECTORY)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
endif()

#
# Install relative directories
#
if(NOT DEFINED INSTALL_LIB_DIR)
  set(INSTALL_LIB_DIR lib)
endif()
if(NOT DEFINED INSTALL_BIN_DIR)
  set(INSTALL_BIN_DIR bin)
endif()
if(NOT DEFINED INSTALL_INCLUDE_DIR)
  set(INSTALL_INCLUDE_DIR include)
endif()
if(NOT DEFINED INSTALL_CMAKE_DIR)
  set(INSTALL_CMAKE_DIR cmake)
endif()

#
# Build library
#
set(SRCS
  src/api.c
  src/dumper.c
  src/emitter.c
  src/loader.c
  src/parser.c
  src/reader.c
  src/scanner.c
  src/writer.c
  )

set(config_h ${CMAKE_CURRENT_BINARY_DIR}/include/config.h)
configure_file(
  cmake/config.h.in
  ${config_h}
  )

add_library(yaml ${SRCS})

if(NOT BUILD_SHARED_LIBS)
  set_target_properties(yaml
    PROPERTIES OUTPUT_NAME ${YAML_STATIC_LIB_NAME}
  )
endif()

set_target_properties(yaml
  PROPERTIES DEFINE_SYMBOL YAML_DECLARE_EXPORT
  )

target_compile_definitions(yaml
  PRIVATE HAVE_CONFIG_H
  PUBLIC
    $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:YAML_DECLARE_STATIC>
    $<$<BOOL:${MSVC}>:_CRT_SECURE_NO_WARNINGS>
  )

target_include_directories(yaml PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
  $<INSTALL_INTERFACE:${INSTALL_INCLUDE_DIR}>
  )

#
# Install rules
#
install(
  FILES
    include/yaml.h
  DESTINATION include COMPONENT Development
  )

install(
  TARGETS yaml
  EXPORT yamlTargets
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT Runtime
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT Development
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT Development
  )

#
# Add tests
#
include(CTest) # This module defines BUILD_TESTING option
if(BUILD_TESTING)
  add_subdirectory(tests)
endif()

#
# Generate 'yamlConfig.cmake', 'yamlConfigVersion.cmake' and 'yamlTargets.cmake'
#
include(CMakePackageConfigHelpers)

# Configure 'yamlConfig.cmake' for a build tree
set(CONFIG_DIR_CONFIG ${PROJECT_BINARY_DIR})
set(config_file ${PROJECT_BINARY_DIR}/yamlConfig.cmake)
configure_package_config_file(
  yamlConfig.cmake.in
  ${config_file}
  INSTALL_DESTINATION ${PROJECT_BINARY_DIR}
  PATH_VARS CONFIG_DIR_CONFIG
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
  )

# Configure 'yamlTargets.cmake' for a build tree
export(TARGETS yaml
  FILE ${PROJECT_BINARY_DIR}/yamlTargets.cmake
  )

# Configure and install 'yamlConfig.cmake' for an install tree
set(CONFIG_DIR_CONFIG ${INSTALL_CMAKE_DIR})
set(install_config_file ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/yamlConfig.cmake )
configure_package_config_file(
  yamlConfig.cmake.in
  ${install_config_file}
  INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/${INSTALL_CMAKE_DIR}
  PATH_VARS CONFIG_DIR_CONFIG
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
  )
install(
  FILES ${install_config_file}
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT Development
  )

# Configure and install 'yamlTargets.cmake' for an install tree
install(EXPORT yamlTargets
  FILE yamlTargets.cmake
  DESTINATION ${INSTALL_CMAKE_DIR}
  COMPONENT Development
  )

# Configure 'yamlConfigVersion.cmake' for a build tree
set(config_version_file ${PROJECT_BINARY_DIR}/yamlConfigVersion.cmake)
write_basic_package_version_file(
    ${config_version_file}
    VERSION ${YAML_VERSION_STRING}
    COMPATIBILITY AnyNewerVersion
)
# ... and install for an install tree
install(
  FILES ${config_version_file}
  DESTINATION ${INSTALL_CMAKE_DIR} COMPONENT Development
  )

if(DEFINED DCP_TO_LL)
  if(NOT DEFINED DECOMPOSITION_PASS_ROOT)
    message(FATAL_ERROR "DECOMPOSITION_PASS_ROOT is not defined.")
  endif()
  message(STATUS "DECOMPOSITION_PASS_ROOT: ${DECOMPOSITION_PASS_ROOT}")

  set_target_properties(yaml PROPERTIES
    LINKER_LANGUAGE NONE
    COMPILE_FLAGS "-emit-llvm -S -O0 -g -disable-llvm-passes -Xclang -disable-O0-optnone"
  )
  add_custom_command(TARGET yaml POST_BUILD
    COMMAND ${Python_EXECUTABLE} ${DECOMPOSITION_PASS_ROOT}/Source/Python/compiler_helper.py --Intermediate ${CMAKE_CURRENT_BINARY_DIR} --Source ${CMAKE_SOURCE_DIR} --Module yaml
  )
elseif(DEFINED DCP_W_PLUGIN)
  if(NOT DEFINED DECOMPOSITION_PASS_ROOT)
    message(FATAL_ERROR "DECOMPOSITION_PASS_ROOT is not defined.")
  endif()
  message(STATUS "DECOMPOSITION_PASS_ROOT: ${DECOMPOSITION_PASS_ROOT}")
  if(NOT DEFINED ClANG_PLUGIN_PATH)
    set(ClANG_PLUGIN_PATH "${DECOMPOSITION_PASS_ROOT}/Binaries/Clang/libDecompositionPreprocessorPass.so")
  endif ()
  message(STATUS "ClANG_PLUGIN_PATH: ${ClANG_PLUGIN_PATH}")

  set_target_properties(yaml PROPERTIES
    LINKER_LANGUAGE NONE
    COMPILE_FLAGS "-emit-llvm -S -O0 -g -disable-llvm-passes -Xclang -disable-O0-optnone -Xclang -load -Xclang ${ClANG_PLUGIN_PATH} -dcp-root ${DECOMPOSITION_PASS_ROOT} -Xclang -plugin -Xclang decomposition-plugin-preprocessor"
  )
endif()
