include(CTest)

add_test(model_irf1 test_from_defaults)
add_test(model_irf2 test_from_file)

set(model_irf1_src test_from_defaults.f90)
set(model_irf2_src test_from_file.f90)

include_directories(${CMAKE_Fortran_MODULE_DIRECTORY})

add_executable(test_from_defaults ${model_irf1_src})
target_link_libraries(test_from_defaults ${diffusion_lib})

add_executable(test_from_file ${model_irf2_src})
target_link_libraries(test_from_file ${diffusion_lib})

file(
  COPY ${CMAKE_CURRENT_SOURCE_DIR}/test.cfg
  DESTINATION ${CMAKE_BINARY_DIR}/tests)
