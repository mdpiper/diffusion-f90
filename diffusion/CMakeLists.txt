set(diffusion_src diffusion.f90 main.f90)

add_executable(${diffusion_exe} ${diffusion_src})

add_library(${diffusion_lib} SHARED ${diffusion_src})
target_link_libraries(${diffusion_lib})

install(
  PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/${diffusion_exe}
  DESTINATION bin)
install(
  TARGETS ${diffusion_lib}
  DESTINATION lib)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${diffusion_pkg}.mod
  DESTINATION include)
