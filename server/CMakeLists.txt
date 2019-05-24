include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../common/utils/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../common/skeleton/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../client/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/liveMedia/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/groupsock/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/BasicUsageEnvironment/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/UsageEnvironment/include)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} server_src)

cpplint_check(server_cpplint "${server_src}")

add_definitions(-DALLOW_SERVER_PORT_REUSE)

add_library(server STATIC ${server_src})