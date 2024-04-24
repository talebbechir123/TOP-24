cmake_minimum_required(VERSION 3.10)


set(PROJECT_NAME vector)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")


# set the project name
project(vector)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")


add_library(libvector vector.c)

add_library(libcompute compute.c)
target_link_libraries(libcompute libvector)

add_executable(vector main.c)
target_link_libraries(vector PUBLIC libcompute)
