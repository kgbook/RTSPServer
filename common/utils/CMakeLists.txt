include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../skeleton/include)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} utils_src)

add_library(utils STATIC ${utils_src})

cpplint_check(utils_cpplint "${utils_src}")