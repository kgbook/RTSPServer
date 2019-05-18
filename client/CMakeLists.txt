include_directories(${CMAKE_CURRENT_SOURCE_DIR})

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} client_src)

add_library(client STATIC ${client_src})

cpplint_check(client_cpplint "${client_src}")