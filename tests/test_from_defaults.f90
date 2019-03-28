program test_model_sanity_from_defaults

  use diffusion
  implicit none

  integer :: file_unit = 0
  type (diffusion_model) :: m

  write(file_unit,"(a)",advance="no") "Initializing..."
  call initialize_from_defaults(m)
  write(file_unit,*) "Done."

  write(file_unit,"(a)") "Model info..."
  call print_info(file_unit, m)

  write(file_unit,"(a)") "Model initial values..."
  call print_values(file_unit, m)

  write(file_unit,"(a)", advance="no") "Cleaning up arrays..."
  call cleanup(m)
  write(file_unit,*) "Done"

end program test_model_sanity_from_defaults
