cmake_minimum_required(VERSION 2.8)

project(diffusion-f90 Fortran)
set (DIFFUSION_VERSION 0.1)

add_subdirectory(diffusion)
add_subdirectory(tests)

include(CTest)

