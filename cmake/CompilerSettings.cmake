message(STATUS "CompilerSettings: Build type: ${CMAKE_BUILD_TYPE}")

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # GNU: GCC, Clang (on Linux, macOS, or MinGW on Windows)
    message(STATUS "CompilerSettings: GCC/Clang compiler detected")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # MSVC:  Microsoft Visual Studio MSVC compiler (on Windows)
    message(STATUS "CompilerSettings: MSVC compiler detected")
else()
    message(
        FATAL_ERROR
            "CompilerSettings: Unknown compiler detected: ${CMAKE_CXX_COMPILER_ID}"
    )
endif()

# cmake-format: off
function(apply_compiler_settings target options)
  # Use build-type-specific flags
  target_compile_options(${target} ${options}
    # GNU: GCC, Clang (on Linux, macOS, or MinGW on Windows)
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:Debug>>:-DBUILD_TYPE_DEBUG -Wall -Wextra -Wpedantic -g -O0>
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:MinSizeRel>>:-DBUILD_TYPE_MINSIZEREL -DNDEBUG -Os>
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:RelWithDebInfo>>:-DBUILD_TYPE_RELWITHDEBINFO -DNDEBUG -g -O2>
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:Release>>:-DBUILD_TYPE_RELEASE -DNDEBUG -flto -O3>
    # MSVC:  Microsoft Visual Studio MSVC compiler (on Windows)
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Debug>>:/DBUILD_TYPE_DEBUG /W4 /Zi /Od>
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:MinSizeRel>>:/DBUILD_TYPE_MINSIZEREL /DNDEBUG /O1 BUILD_TYPE_MINSIZEREL>
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:RelWithDebInfo>>:/DBUILD_TYPE_RELWITHDEBINFO /DNDEBUG /Zi /O2 BUILD_TYPE_RELWITHDEBINFO>
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Release>>:/DBUILD_TYPE_RELEASE /DNDEBUG /GL /LTCG /O2>
  )
endfunction()
# cmake-format: on
