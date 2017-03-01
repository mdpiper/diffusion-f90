cmake_minimum_required (VERSION 2.6)

project (diffusion)
enable_language (Fortran)
include (CTest)

add_test (MODEL_IRF test_model_sanity_from_defaults)

set (BUILD_SHARED_LIBS ON)

include_directories (${CMAKE_BINARY_DIR}/diffusion)

set (model_irf_sources test_model_sanity_from_defaults.f90)

add_executable (test_model_sanity_from_defaults ${model_irf_sources})

target_link_libraries (test_model_sanity_from_defaults diffusion)
