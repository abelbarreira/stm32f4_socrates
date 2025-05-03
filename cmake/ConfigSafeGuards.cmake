if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(
        FATAL_ERROR
            "In-source builds not allowed. Please make a build directory.")
endif()
