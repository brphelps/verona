include(${CMAKE_CURRENT_LIST_DIR}/common.cmake)

PrepareTest(VERONAC_FLAGS EXPECTED_DUMP ACTUAL_DUMP)

list(APPEND VERONAC_FLAGS --disable-colors)

CheckStatus(
  COMMAND ${VERONAC} ${VERONAC_FLAGS} ${TEST_FILE}
  EXPECTED_STATUS 0
  ERROR_FILE ${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME}.out)

FileCheck(${TEST_FILE} ${ACTUAL_DUMP}/stderr.txt)

if(EXPECTED_DUMP)
  CheckDump(${EXPECTED_DUMP} ${ACTUAL_DUMP})
endif()
