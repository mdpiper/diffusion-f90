program test_model_sanity_from_file

  use diffusion
  implicit none

  character (len=8) :: cfg_file = "test.cfg"

  write (*,"(a20, a8)") "Configuration file: ", cfg_file
  write (*,"(a)", advance="no") "Initializing..."
  call initialize_from_file(cfg_file)
  write (*,*) "Done."

  write (*,"(a)", advance="no") "Cleaning up arrays..."
  call cleanup()
  write (*,*) "Done"

end program test_model_sanity_from_file
