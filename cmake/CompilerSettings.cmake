# Restrict the user to only use Debug and Release configurations
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)

message(STATUS "CompilerSettings: Build type: ${CMAKE_BUILD_TYPE}")

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  message(STATUS "CompilerSettings: MSVC compiler detected")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  message(STATUS "CompilerSettings: GCC/Clang compiler detected")
else()
  message(FATAL_ERROR "CompilerSettings: Unknown compiler detected: ${CMAKE_CXX_COMPILER_ID}")
endif()

function(apply_compiler_settings target options)
  # Use build-type-specific flags
  target_compile_options(${target} ${options}
    # GNU: GCC, Clang (on Linux, macOS, or MinGW on Windows)
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:Debug>>:-Wall -Wextra -Wpedantic -g -O0>
    $<$<AND:$<CXX_COMPILER_ID:GNU>,$<CONFIG:Release>>:-DNDEBUG -flto -O3>
    # MSVC:  Microsoft Visual Studio MSVC compiler (on Windows)
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Debug>>:/W4 /Zi /Od>
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Release>>:/DNDEBUG /GL /LTCG /O2>
  )
endfunction()
