program main

  use diffusion
  implicit none

  write (*,*) "Start."
  call initialize_from_defaults()
  call cleanup()
  write (*,*) "Finish."

end program main
