# Design

## Structure

``` text
CMakeLists.txt

app/
    CMakesLists.txt
    main.cc

cmake/
    *.cmake

docs/
    Doxyfile
    html/
    SUMMARY.md

external/
    CMakesLists.txt
    ...

src/
    CMakesLists.txt

    command_processor/

    platform/
        protocol/
        hal_simulator/
        hal_stm32f4/

    test_processor/

tests/
    unit_test/
        CMakeLists.txt
        main.c

    python/

tools/
```
