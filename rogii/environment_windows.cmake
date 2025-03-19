include(${CMAKE_CURRENT_LIST_DIR}/msvs_package.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/windowssdk_package.cmake)

if(OSG_USE_SS_OWN_ANGLE)
    CNPM_ADD_PACKAGE(
        NAME
            angle
        VERSION
            6778.0.0
        BUILD_NUMBER
            13
        TAG
            "sdk22621_vsbt22"
    )
endif()
