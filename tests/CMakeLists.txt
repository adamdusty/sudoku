cmake_minimum_required(VERSION 3.25)

project(
    sudokuTests
    LANGUAGES CXX
)

if(PROJECT_IS_TOP_LEVEL)
    find_package(sudoku REQUIRED)
    enable_testing()
endif()

include(FetchContent)
FetchContent_Declare(
    snitch
    GIT_REPOSITORY https://github.com/cschreib/snitch.git
    GIT_TAG        v1.2.2
    FIND_PACKAGE_ARGS
)
FetchContent_MakeAvailable(snitch)

add_executable(sudoku_tests
    src/sudoku_test.cpp
)

target_link_libraries(sudoku_tests PRIVATE sudoku_lib snitch::snitch)

add_test(NAME sudoku_tests COMMAND sudoku_tests)
