# CMakeLists.txt example for STXXL

project(lcs)
cmake_minimum_required(VERSION 2.8)

# disallow in-source builds
if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
message(SEND_ERROR "In-source builds are not allowed.")
endif("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

# enable warnings (always good)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -W -Wall")

#build a program and link it with STXXL.

add_executable(lcs-our-alg-opt-uneq lcs-our-alg-opt-uneq.c)
add_executable(lcs-classic lcs-classic.c)
add_executable(lcs-hirschberg-opt-uneq lcs-hirschberg-opt-uneq.c)
target_link_libraries(lcs-our-alg-opt-uneq m)
target_link_libraries(lcs-classic m)
target_link_libraries(lcs-hirschberg-opt-uneq m)
