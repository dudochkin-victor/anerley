FIND_PACKAGE(ZLIB REQUIRED)
FIND_PACKAGE(Qt4 4.7 COMPONENTS QtCore QtXml QtDbus REQUIRED)
FIND_PACKAGE(TinyCDB REQUIRED)

SET(VERSION_MAJOR 0)
SET(VERSION_MINOR 0)
SET(VERSION_PATCH 0)

PKG_CHECK_MODULES(DBUS dbus-1 REQUIRED)

INCLUDE(${QT_USE_FILE})
ADD_DEFINITIONS(${QT_DEFINITIONS})

INCLUDE_DIRECTORIES(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/common
    ${QT_INCLUDES}
#    ${DBUS_INCLUDE_DIRS}
    ${TINYCDB_INCLUDE_DIR}
    )

SET (LIBRARY contextsubscriber)

SET(LIBRARY_SRCS
	anerley-tp-feed.c 
	anerley-feed.c 
	anerley-item.c 
	anerley-tp-item.c 
	anerley-tile.c 
	anerley-simple-grid-view.c 
	anerley-feed-model.c 
	anerley-tile-view.c 
	anerley-aggregate-feed.c 
	anerley-aggregate-tp-feed.c 
	anerley-econtact-item.c 
	anerley-ebook-feed.c 
	anerley-tp-observer.c 
	anerley-tp-monitor-feed.c 
	anerley-presence-chooser.c 
	anerley-tp-user-avatar.c 
	anerley-main.c 
	anerley-compact-tile.c 
	anerley-compact-tile-view.c
#	$(libanerley_la_HEADERS) 
#	$(BUILT_SOURCES) 
	penge-magic-texture.c 
	penge-magic-texture.h
    )

SET(LIBRARY_HEADERS
    )

#QT4_WRAP_CPP(LIBRARY_MOC_HEADERS ${LIBRARY_HEADERS})

ADD_DEFINITIONS(-DDEFAULT_CONTEXT_SUBSCRIBER_PLUGINS="@libdir@/contextkit/subscriber-plugins")
ADD_DEFINITIONS(-DDEFAULT_CONTEXT_PROVIDERS="@datadir@/contextkit/providers/")
ADD_DEFINITIONS(-DDEFAULT_CONTEXT_CORE_DECLARATIONS="@datadir@/contextkit/core.context")
ADD_DEFINITIONS(-DDEFAULT_CONTEXT_TYPES="@datadir@/contextkit/types/")
ADD_DEFINITIONS(-DDEFAULT_CONTEXT_CORE_TYPES="@datadir@/contextkit/types/core.types")
ADD_DEFINITIONS(-DCONTEXT_LOG_MODULE_NAME="libcontextsubscriber")

ADD_LIBRARY(${LIBRARY} SHARED ${LIBRARY_SRCS} ${LIBRARY_HEADERS})
# ${LIBRARY_MOC_HEADERS}
SET_TARGET_PROPERTIES( ${LIBRARY} PROPERTIES
     SOVERSION 0
     VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}
   )


TARGET_LINK_LIBRARIES(${LIBRARY}
    ${ZLIB_LIBRARIES}
    ${QT_LIBRARIES}
    ${TINYCDB_LIBRARY}
    common
    )

INSTALL(TARGETS ${LIBRARY} DESTINATION ${PKG_LIBDIR})
#INSTALL(FILES assoctree.h asyncdbusinterface.h contextjson.h 
#	contextproperty.h contextpropertyinfo.h contextproviderinfo.h 
#	contextregistryinfo.h contexttypeinfo.h contexttyperegistryinfo.h 
#	duration.h iproviderplugin.h timedvalue.h 
#	DESTINATION ${PKG_INCLUDEDIR}/contextsubscriber)

