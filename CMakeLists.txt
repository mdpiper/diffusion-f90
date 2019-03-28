cmake_minimum_required(VERSION 2.8)

set(diffusion_pkg diffusion)
project(${diffusion_pkg}f Fortran)

set(diffusion_exe run_${CMAKE_PROJECT_NAME})
set(diffusion_lib ${CMAKE_PROJECT_NAME})

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

add_subdirectory(diffusion)
add_subdirectory(tests)

include(CTest)

