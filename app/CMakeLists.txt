add_executable(${TARGET_MAIN_APP} main.cc)
target_link_libraries(${TARGET_MAIN_APP} PUBLIC ${TARGET_MODULE_A} ${TARGET_MODULE_B} ${TARGET_MODULE_C})
