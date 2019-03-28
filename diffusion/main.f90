program main

  use diffusion
  implicit none

  character (len=*), parameter :: output_file = "diffusionf.out"
  integer, parameter :: file_unit = 1

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
     write(*,"(a)") "Output is written to the file `diffusionf.out`."
     return
  end if

  open(file_unit,file=output_file)

  write(file_unit,"(a)") "Start model."
  call initialize_from_file(model, arg)

  write(file_unit,"(a)") "Model info..."
  call print_info(file_unit, model)

  write(file_unit,"(a)") "Model initial values..."
  call print_values(file_unit, model)

  do while (model%t < model%t_end)
     call advance_in_time(model)
     write(file_unit,"(a, f6.1)") "Model values at time = ", model%t
     call print_values(file_unit, model)
  end do

  call cleanup(model)
  write(file_unit,"(a)") "Finish model."

  close(file_unit)

end program main
