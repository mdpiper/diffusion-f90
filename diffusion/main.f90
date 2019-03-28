program main

  use diffusion
  implicit none

  integer :: file_unit = 0
  integer :: arg_count = 0
  character (len=80) :: arg
  type (diffusion_model) :: model

  do while (arg_count <= 1)
    call get_command_argument(arg_count, arg)
    arg_count = arg_count + 1
  end do

  if (len_trim(arg) == 0) then
     write(file_unit,"(a)") "Usage: run_diffusionf CONFIGURATION_FILE"
     write(file_unit,"(a)")
     write(file_unit,"(a)") "Run the diffusionf model with a configuration file."
     return
  end if

  write(file_unit,"(a)") "Start"
  call initialize_from_file(model, arg)

  write(file_unit,"(a)") "Model initial values..."
  call print_values(file_unit, model)

  do while (model%t < model%t_end)
     call advance_in_time(model)
     write(file_unit,"(a, f6.1)") "Model values at time = ", model%t
     call print_values(file_unit, model)
  end do

  call cleanup(model)
  write(file_unit,"(a)") "Finish"

end program main
