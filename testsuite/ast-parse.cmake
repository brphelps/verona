include(${CMAKE_CURRENT_LIST_DIR}/common.cmake)

set(ACTUAL_DUMP ${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME})

PrepareTest(VERONAC_FLAGS EXPECTED_DUMP ACTUAL_DUMP)

CheckStatus(
  COMMAND ${VERONA_AST} -a -g ${GRAMMAR} ${TEST_FILE}
  OUTPUT_FILE ${ACTUAL_DUMP}/ast.txt
  EXPECTED_STATUS 0)

CheckStatus(
  COMMAND ${VERONA_TYPED_AST} -a -g ${GRAMMAR} ${TEST_FILE}
  OUTPUT_FILE ${ACTUAL_DUMP}/typed-ast.txt
  EXPECTED_STATUS 0)

if(EXPECTED_DUMP)
  CheckDump(${EXPECTED_DUMP} ${ACTUAL_DUMP})
endif()
