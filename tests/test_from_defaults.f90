program test_model_sanity_from_defaults

  use diffusion
  implicit none

  type (diffusion_model) :: m
  integer :: i, j
  character(len=30) :: rowfmt

  write(*,"(a)",advance="no") "Initializing..."
  call initialize_from_defaults(m)
  write(*,*) "Done."

  write(*,"(a)") "Model info..."
  call print_info(m)

  write(*,"(a)") "Model initial values..."
  call print_values(m)

  write(*,"(a)", advance="no") "Cleaning up arrays..."
  call cleanup(m)
  write(*,*) "Done"

end program test_model_sanity_from_defaults
