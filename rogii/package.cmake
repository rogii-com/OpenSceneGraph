if(
    TARGET osg::threads
    AND TARGET osg::library
    AND TARGET osg::util
    AND TARGET osg::db
    AND TARGET osg::ga
    AND TARGET osg::text
    AND TARGET osg::viewer
)
    return()
endif()

# ===================================================================
add_library(
    osg::threads
    SHARED
    IMPORTED
)

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") AND (CMAKE_SIZEOF_VOID_P MATCHES "8"))
    SET(
        OSG_LIB_POSTFIX
        "64"
    )
endif()


if(MSVC)
    set_target_properties(
        osg::threads
        PROPERTIES
            IMPORTED_LOCATION
                "${CMAKE_CURRENT_LIST_DIR}/bin/OpenThreads.dll"
            IMPORTED_LOCATION_DEBUG
                "${CMAKE_CURRENT_LIST_DIR}/bin/OpenThreadsd.dll"
            IMPORTED_IMPLIB
                "${CMAKE_CURRENT_LIST_DIR}/lib/OpenThreads.lib"
            IMPORTED_IMPLIB_DEBUG
                "${CMAKE_CURRENT_LIST_DIR}/lib/OpenThreadsd.lib"
            INTERFACE_INCLUDE_DIRECTORIES
                "${CMAKE_CURRENT_LIST_DIR}/include/"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
            osg::threads
            PROPERTIES
                IMPORTED_LOCATION
                    "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/OpenThreads.so.3.3.0"
                IMPORTED_LOCATION_DEBUG
                    "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/OpenThreadsd.so.3.3.0"
                INTERFACE_INCLUDE_DIRECTORIES
                    "${CMAKE_CURRENT_LIST_DIR}/include/"
    )
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_Threads
)

foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::library
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::library
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osg.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osg.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::library
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osg.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgd.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads"
    )
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_library
)

# depends on threads
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::util
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::util
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgUtil.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgUtild.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgUtil.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgUtild.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::util
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgUtil.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgUtild.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library"
    )
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_Util
)

# depends on threads and osg
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::db
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::db
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgDB.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgDBd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgDB.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgDBd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::db
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgDB.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgDBd.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util"
    )
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_DB
)

# depends on threads, osg and osg::util
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
            $<TARGET_FILE:osg::db>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::ga
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::ga
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgGA.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgGAd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgGA.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgGAd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::ga
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgGA.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgGAd.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db"
    )
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_GA
)

# depends on threads, osg, osg::util and osg::db
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
            $<TARGET_FILE:osg::db>
            $<TARGET_FILE:osg::ga>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::text
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::text
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgText.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgTextd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgText.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgTextd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::text
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgText.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgTextd.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db"
)
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_Text
)

# depends on threads, osg, osg::util and osg::db
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
            $<TARGET_FILE:osg::db>
            $<TARGET_FILE:osg::text>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
add_library(
    osg::viewer
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
    osg::viewer
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgViewer.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/osgViewerd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgViewer.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/osgViewerd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db;osg::text;osg::ga"
)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    osg::viewer
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgViewer.so.3.4.0"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib${OSG_LIB_POSTFIX}/osgViewerd.so.3.4.0"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include/"
        INTERFACE_LINK_LIBRARIES
            "osg::threads;osg::library;osg::util;osg::db;osg::text;osg::ga"
)
endif()

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG_Viewer
)

# depends on threads, osg, osg::util, osg::db, osg::text and osg::ga
foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
            $<TARGET_FILE:osg::db>
            $<TARGET_FILE:osg::text>
            $<TARGET_FILE:osg::ga>
            $<TARGET_FILE:osg::viewer>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()

# ===================================================================
set(
    COMPONENT_NAMES

    CNPM_RUNTIME_OSG
    CNPM_RUNTIME
)

foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:osg::threads>
            $<TARGET_FILE:osg::library>
            $<TARGET_FILE:osg::util>
            $<TARGET_FILE:osg::db>
            $<TARGET_FILE:osg::text>
            $<TARGET_FILE:osg::ga>
            $<TARGET_FILE:osg::viewer>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()