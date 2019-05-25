include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../common/utils/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../common/skeleton/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../client/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../server/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/liveMedia/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/groupsock/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/BasicUsageEnvironment/include
        ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/live555/UsageEnvironment/include)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} test_src)

cpplint_check(test_cpplint "${test_src}")

add_executable(clientApp testClient.cpp)
add_executable(serverApp testServer.cpp)

if (${CMAKE_HOST_SYSTEM_NAME} MATCHES Darwin)
    set(Boost_libs boost_thread-mt boost_filesystem-mt boost_system-mt boost_chrono-mt)
else()
    set(Boost_libs boost_thread boost_filesystem boost_system boost_chrono)
endif ()

target_link_libraries(clientApp client utils skeleton fmt avformat avcodec avutil
        ${Boost_libs} pthread)

target_link_libraries(serverApp server utils skeleton fmt
        liveMedia BasicUsageEnvironment UsageEnvironment groupsock
        ${Boost_libs} pthread)