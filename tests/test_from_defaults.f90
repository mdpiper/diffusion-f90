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
  write(*,"(a10, i8)") "n_x:", m%n_x
  write(*,"(a10, i8)") "n_y:", m%n_y
  write(*,"(a10, f8.2)") "dx:", m%dx
  write(*,"(a10, f8.2)") "dy:", m%dy
  write(*,"(a10, f8.2)") "dt:", m%dt
  write(*,"(a10, f8.2)") "t:", m%t
  write(*,"(a10, f8.2)") "t_end:", m%t_end

  write(*,"(a)") "Model initial values..."
  write(rowfmt,'(a,i4,a)') '(', m%n_x, '(1x,f4.1))'
  do i = 1, m%n_y
     write(*,fmt=rowfmt) (m%density(i,j), j=1,m%n_x)
  end do

  write(*,"(a)", advance="no") "Cleaning up arrays..."
  call cleanup(m)
  write(*,*) "Done"

end program test_model_sanity_from_defaults
