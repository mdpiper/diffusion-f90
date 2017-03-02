cmake_minimum_required (VERSION 2.6)

project (diffusion)
enable_language (Fortran)
include (CTest)

add_test (MODEL_IRF1 test_from_defaults)
add_test (MODEL_IRF2 test_from_file)

set (BUILD_SHARED_LIBS ON)

include_directories (${CMAKE_BINARY_DIR}/diffusion)

set (model_irf1_sources test_from_defaults.f90)
set (model_irf2_sources test_from_file.f90)

add_executable (test_from_defaults ${model_irf1_sources})
add_executable (test_from_file ${model_irf2_sources})

file (
  COPY ${CMAKE_CURRENT_SOURCE_DIR}/test.cfg
  DESTINATION ${CMAKE_BINARY_DIR}/tests)

target_link_libraries (test_from_defaults diffusion)
target_link_libraries (test_from_file diffusion)
