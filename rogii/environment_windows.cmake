include(${CMAKE_CURRENT_LIST_DIR}/msvs_package.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/windowssdk_package.cmake)

if(OSG_QT_ANGLE)
    CNPM_ADD_PACKAGE(
        NAME
            Qt
        VERSION
            5.15.1
        BUILD_NUMBER
            1
        TAG
            "sdk18362_vsbt19"
    )
endif()