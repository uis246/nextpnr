IF(CMAKE_CROSSCOMPILING)
    SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Point it to the export file from a native build")
    INCLUDE(${IMPORT_EXECUTABLES})
ENDIF(CMAKE_CROSSCOMPILING)

IF(NOT CMAKE_CROSSCOMPILING)
    ADD_EXECUTABLE(bbasm bba/main.cc)
    target_link_libraries(bbasm LINK_PUBLIC ${Boost_PROGRAM_OPTIONS_LIBRARY} ${Boost_FILESYSTEM_LIBRARY} ${Boost_SYSTEM_LIBRARY})
ENDIF(NOT CMAKE_CROSSCOMPILING)

IF(NOT CMAKE_CROSSCOMPILING)
    EXPORT(TARGETS bbasm FILE ${CMAKE_BINARY_DIR}/ImportExecutables.cmake )
ENDIF(NOT CMAKE_CROSSCOMPILING)

include(TestBigEndian)
TEST_BIG_ENDIAN(IS_BIG_ENDIAN)
if(IS_BIG_ENDIAN)
	set(BBASM_ENDIAN_FLAG "--be")
else()
	set(BBASM_ENDIAN_FLAG "--le")
endif()