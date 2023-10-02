install(
    TARGETS sudoku_exe
    RUNTIME COMPONENT sudoku_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
