# - Try to find LibXml2
# Once done this will define
#  LIBXML2_FOUND - System has LibXml2
#  LIBXML2_INCLUDE_DIRS - The LibXml2 include directories
#  LIBXML2_LIBRARIES - The libraries needed to use LibXml2
#  LIBXML2_DEFINITIONS - Compiler switches required for using LibXml2

find_path(TINYCDB_INCLUDE_DIR cdb.h
          HINTS ${PC_CDB_INCLUDEDIR} ${PC_CDB_INCLUDE_DIRS}
          PATH_SUFFIXES cdb )

find_library(TINYCDB_LIBRARY NAMES cdb
             HINTS ${PC_CDB_LIBDIR} ${PC_CDB_LIBRARY_DIRS} )

set(TINYCDB_LIBRARIES ${CDB_LIBRARY} )
set(TINYCDB_INCLUDE_DIRS ${CDB_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(cdb  DEFAULT_MSG
                                  TINYCDB_LIBRARY TINYCDB_INCLUDE_DIR)

mark_as_advanced(TINYCDB_INCLUDE_DIR TINYCDB_LIBRARY )
