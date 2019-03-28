program test_model_sanity_from_file

  use diffusion
  implicit none

  character (len=*), parameter :: cfg_file = "test.cfg"

  integer :: file_unit = 0
  type (diffusion_model) :: m

  write(file_unit,"(a20, a8)") "Configuration file: ", cfg_file
  write(file_unit,"(a)", advance="no") "Initializing..."
  call initialize_from_file(m, cfg_file)
  write(file_unit,*) "Done."

  write(file_unit,"(a)") "Model info..."
  call print_info(m)

  write(file_unit,"(a)") "Model initial values..."
  call print_values(file_unit, m)

  write(file_unit,"(a)", advance="no") "Cleaning up arrays..."
  call cleanup(m)
  write(file_unit,*) "Done"

end program test_model_sanity_from_file
