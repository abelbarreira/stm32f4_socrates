set(MODULE_C_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_c.hpp")
set(MODULE_C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/module_c.cpp")

add_library(${TARGET_MODULE_C} STATIC ${MODULE_C_HEADERS} ${MODULE_C_SOURCES})
target_include_directories(${TARGET_MODULE_C}
                           PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${TARGET_MODULE_C} PUBLIC ${TARGET_MODULE_A})
apply_compiler_settings(${TARGET_MODULE_C} PRIVATE)
