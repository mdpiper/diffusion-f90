program test_model_sanity_from_defaults

  use diffusion
  implicit none

  write (*,"(A)",advance="no") "Initializing..."
  call initialize_from_defaults()
  write (*,*) "Done."

  write (*,"(A)", advance="no") "Cleaning up arrays..."
  call cleanup()
  write (*,*) "Done"

end program test_model_sanity_from_defaults
