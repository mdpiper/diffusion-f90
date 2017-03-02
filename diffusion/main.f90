program main

  use diffusion
  implicit none

  type (diffusion_model) :: model

  write (*,*) "Start."
  call initialize_from_defaults(model)
  call cleanup(model)
  write (*,*) "Finish."

end program main
