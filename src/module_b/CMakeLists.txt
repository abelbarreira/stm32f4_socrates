set(MODULE_B_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_b.hpp")
set(MODULE_B_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/module_b.cpp")

add_library(${TARGET_MODULE_B} STATIC ${MODULE_B_HEADERS} ${MODULE_B_SOURCES})
target_include_directories(${TARGET_MODULE_B}
                           PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
apply_compiler_settings(${TARGET_MODULE_B} PRIVATE)
