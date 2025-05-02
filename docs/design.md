# Design

## Generic

``` text
CMakeLists.txt
    ...

    set(TARGET_MAIN_APP main_app)
    set(TARGET_MODULE_A module_a) # Library, Header only library, Interface
    set(TARGET_MODULE_B module_b) # Library with Header and Source files
    set(TARGET_MODULE_C module_c) # Library with Header and Source files, using module_a

    add_subdirectory(src)
    add_subdirectory(app)

app/
    CMakesLists.txt
        add_executable(${TARGET_MAIN_APP} main.cc)
        target_link_libraries(${TARGET_MAIN_APP} PUBLIC ${TARGET_MODULE_A} ${TARGET_MODULE_B} ${TARGET_MODULE_C})

    main.cc
        #include "module_a.hpp"
        #include "module_b.hpp"
        #include "module_c.hpp"

src/
    CMakesLists.txt
        add_subdirectory(module_a)
        add_subdirectory(module_b)
        add_subdirectory(module_c)

    module_a/
        CMakeLists.txt
            set(MODULE_A_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_a.hpp")
            add_library(${TARGET_MODULE_A} INTERFACE ${MODULE_A_HEADERS})
            target_include_directories(${TARGET_MODULE_A} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

        module_a.hpp

    module_b/
        CMakeLists.txt
            set(MODULE_B_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_b.hpp")
            set(MODULE_B_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/module_b.cpp")

            add_library(${TARGET_MODULE_B} STATIC ${MODULE_B_HEADERS} ${MODULE_B_SOURCES})
            target_include_directories(${TARGET_MODULE_B} PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR})

        module_b.hpp/.cpp

    module_c/
        CMakeLists.txt
            set(MODULE_C_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/module_c.hpp")
            set(MODULE_C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/module_c.cpp")

            add_library(${TARGET_MODULE_C} STATIC ${MODULE_C_HEADERS} ${MODULE_C_SOURCES})
            target_include_directories(${TARGET_MODULE_C} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

            target_link_libraries(${TARGET_MODULE_C} PUBLIC ${TARGET_MODULE_A})

        module_c.hpp/.cpp
            #include "module_a.hpp"
```
