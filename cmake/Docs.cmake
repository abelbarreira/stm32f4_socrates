find_package(Doxygen)
if(DOXYGEN_FOUND)
    # Define a custom target to generate a Doxygen documentation
    set(TARGET_DOXYGEN_DOCS doxygen_docs)
    add_custom_target(
        ${TARGET_DOXYGEN_DOCS}
        ${DOXYGEN_EXECUTABLE}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/docs)
endif()

find_program(DOT_EXECUTABLE dot)
if(DOT_EXECUTABLE)
    # Define a custom target to generate a Graphviz graph of the dependencies
    set(TARGET_DEP_GRAPH dep_graph)
    add_custom_target(
        ${TARGET_DEP_GRAPH}
        COMMAND ${CMAKE_COMMAND} -S ${CMAKE_SOURCE_DIR} -B ${CMAKE_BINARY_DIR}
                --graphviz=${CMAKE_BINARY_DIR}/graph.dot
        COMMAND ${DOT_EXECUTABLE} -Tpng ${CMAKE_BINARY_DIR}/graph.dot -o
                ${CMAKE_SOURCE_DIR}/docs/graph.png
        COMMENT "Generating dependency graph (graph.png)"
        VERBATIM)
endif()
