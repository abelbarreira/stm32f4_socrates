cmake_minimum_required(VERSION 3.22)

# Project name and version
project(
    "stm32f4_socrates"
    VERSION 1.0.0
    LANGUAGES C CXX)

# CMake configuration
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Target names
set(TARGET_MAIN_APP main_app)
set(TARGET_MODULE_A module_a)
set(TARGET_MODULE_B module_b)
set(TARGET_MODULE_C module_c)
set(TARGET_DOXYGEN_DOCS doxygen_docs)

# CMake modules path
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(ConfigSafeGuards)
include(CompilerSettings)
include(Docs)

# Add subdirectories
add_subdirectory(src)
add_subdirectory(app)
