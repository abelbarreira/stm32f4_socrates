set(MODULE_A_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_a.hpp")
add_library(${TARGET_MODULE_A} INTERFACE ${MODULE_A_HEADERS})
target_include_directories(${TARGET_MODULE_A}
                           INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
apply_compiler_settings(${TARGET_MODULE_A} INTERFACE)
