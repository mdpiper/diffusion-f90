program main

  use diffusion
  implicit none

  integer :: arg_count = 0
  character (len=80) :: arg
  type (diffusion_model) :: model

  do while (arg_count <= 1)
    call get_command_argument(arg_count, arg)
    arg_count = arg_count + 1
  end do

  if (len_trim(arg) == 0) then
     write(*,"(a)") "Usage: run_diffusionf CONFIGURATION_FILE"
     write(*,"(a)")
     write(*,"(a)") "Run the diffusionf model with a configuration file."
     return
  end if

  write(*,"(a)") "Start"
  call initialize_from_file(model, arg)

  write(*,"(a)") "Model initial values..."
  call print_values(model)

  do while (model%t < model%t_end)
     call advance_in_time(model)
     write(*,"(a, f6.1)") "Model values at time = ", model%t
     call print_values(model)
  end do

  call cleanup(model)
  write(*,"(a)") "Finish"

end program main
