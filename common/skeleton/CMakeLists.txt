include_directories(${CMAKE_CURRENT_SOURCE_DIR})

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} skeleton_src)

add_library(skeleton STATIC ${skeleton_src})

cpplint_check(skeleton_cpplint "${skeleton_src}")