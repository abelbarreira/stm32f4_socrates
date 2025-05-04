find_package(Doxygen)

if(DOXYGEN_FOUND)
    add_custom_target(
        ${TARGET_DOXYGEN_DOCS}
        ${DOXYGEN_EXECUTABLE}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/docs)
endif()
