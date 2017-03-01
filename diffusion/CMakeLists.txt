cmake_minimum_required (VERSION 2.6)

project (diffusion)
enable_language (Fortran)
set (DIFFUSION_VERSION 0.1)

configure_file (${CMAKE_CURRENT_SOURCE_DIR}/diffusion.pc.cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/diffusion.pc)

set (BUILD_SHARED_LIBS ON)

include_directories (${CMAKE_CURRENT_SOURCE_DIR})

set (diffusion_lib_sources diffusion.f90)
add_library (diffusion ${diffusion_lib_sources})

install (
  TARGETS diffusion
  DESTINATION lib
  COMPONENT diffusion)
install (
  FILES diffusion.pc
  DESTINATION lib/pkgconfig)
install (
  FILES ${CMAKE_CURRENT_BINARY_DIR}/diffusion.mod
  DESTINATION lib)
