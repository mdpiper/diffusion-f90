program test_model_sanity_from_defaults

  use diffusion
  implicit none

  type (diffusion_model) :: m

  write (*,"(A)",advance="no") "Initializing..."
  call initialize_from_defaults(m)
  write (*,*) "Done."

  write (*,"(A)", advance="no") "Cleaning up arrays..."
  call cleanup(m)
  write (*,*) "Done"

end program test_model_sanity_from_defaults
