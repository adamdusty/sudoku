cmake_minimum_required(VERSION 3.25)

project(
    sudoku
    VERSION 0.1.0
    DESCRIPTION "A short description"
    LANGUAGES CXX
)

include(cmake/variables.cmake)

add_library(
    sudoku_lib OBJECT
    src/lib.cpp
)

target_include_directories(
    sudoku_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>"
)

add_executable(
    sudoku_exe
    src/main.cpp
)

include(cmake/compile-options.cmake)

target_link_libraries(sudoku_exe PRIVATE sudoku_lib)

set_target_properties(
    sudoku_exe PROPERTIES
    OUTPUT_NAME sudoku
)

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

if(SUDOKU_BUILD_TESTS)
    include(CTest)
    add_subdirectory(tests)
endif()
