include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../common/skeleton/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../common/utils/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../client/include)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} client_src)

add_library(client STATIC ${client_src})

cpplint_check(client_cpplint "${client_src}")