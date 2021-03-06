! An example of the diffusion equation.
module diffusion

  implicit none

  ! Define the attributes of the model.
  type :: diffusion_model
     real :: dt
     real :: t
     real :: t_end

     integer :: n_x
     integer :: n_y

     real :: dx
     real :: dy

     real, pointer :: density(:,:)
     real, pointer :: density_tmp(:,:)
  end type diffusion_model

contains

  ! Initializes the model with values read from a file.
  subroutine initialize_from_file(model, config_file)
    character (len=*), intent (in) :: config_file
    type (diffusion_model), intent (out) :: model

    open(15, file=config_file)
    read(15, *) model%dt, model%t_end, model%n_x, model%n_y
    close(15)
    call initialize(model)
  end subroutine initialize_from_file

  ! Initializes the model with default hardcoded values.
  subroutine initialize_from_defaults(model)
    type (diffusion_model), intent (out) :: model

    model%dt = 1.
    model%t_end = 20.
    model%n_x = 10
    model%n_y = 20
    call initialize(model)
  end subroutine initialize_from_defaults

  ! Allocates memory and sets values for either initialization technique.
  subroutine initialize(model)
    type (diffusion_model), intent (inout) :: model

    model%t = 0.
    model%dx = 1.
    model%dy = 1.

    allocate(model%density(model%n_y, model%n_x))
    allocate(model%density_tmp(model%n_y, model%n_x))

    model%density = 0.
    model%density_tmp = 0.

    call set_boundary_conditions(model%density)
    call set_boundary_conditions(model%density_tmp)
  end subroutine initialize

  ! Sets boundary conditions on values array.
  subroutine set_boundary_conditions(z)
    implicit none
    real, dimension (:,:), intent (out) :: z
    integer :: i, top_x

    top_x = size(z, 2)-1

    do i = 0, top_x
       z(1,i+1) = 0.25*top_x**2 - (i - 0.5*top_x)**2
    end do
  end subroutine set_boundary_conditions

  ! Frees memory when program completes.
  subroutine cleanup(model)
    type (diffusion_model), intent (inout) :: model

    deallocate (model%density)
    deallocate (model%density_tmp)
  end subroutine cleanup

  ! Steps the diffusion model forward in time.
  subroutine advance_in_time(model)
    type (diffusion_model), intent (inout) :: model

    call solve_2d(model)
    model%density = model%density_tmp
    model%t = model%t + model%dt
  end subroutine advance_in_time

  ! The solver for the two-dimensional diffusion equation.
  subroutine solve_2d(model)
    type (diffusion_model), intent (inout) :: model

    real, parameter :: rho = 0.
    real :: dx2
    real :: dy2
    real :: dx2_dy2_rho
    real :: coef
    integer :: i, j

    dx2 = model%dx**2
    dy2 = model%dy**2
    dx2_dy2_rho = dx2 * dy2 * rho
    coef = model%dt / (2. * (dx2 + dy2))

    do i = 2, model%n_y-1
       do j = 2, model%n_x-1
          model%density_tmp(i,j) = coef * ( &
               dx2*(model%density(i-1,j) + model%density(i+1,j)) + &
               dy2*(model%density(i,j-1) + model%density(i,j+1)) - &
               dx2_dy2_rho )
       end do
    end do
  end subroutine solve_2d

  ! A helper routine for displaying model parameters.
  subroutine print_info(file_unit, model)
    type (diffusion_model), intent (in) :: model
    integer :: file_unit

    write(file_unit,"(a10, i8)") "n_x:", model%n_x
    write(file_unit,"(a10, i8)") "n_y:", model%n_y
    write(file_unit,"(a10, f8.2)") "dx:", model%dx
    write(file_unit,"(a10, f8.2)") "dy:", model%dy
    write(file_unit,"(a10, f8.2)") "dt:", model%dt
    write(file_unit,"(a10, f8.2)") "t:", model%t
    write(file_unit,"(a10, f8.2)") "t_end:", model%t_end
  end subroutine print_info

  ! A helper routine that prints the current state of the model.
  subroutine print_values(file_unit, model)
    type (diffusion_model), intent (in) :: model
    integer :: file_unit, i, j
    character(len=30) :: rowfmt

    write(rowfmt,'(a,i4,a)') '(', model%n_x, '(1x,f6.1))'
    do i = 1, model%n_y
       write(file_unit,fmt=rowfmt) model%density(i,:)
    end do
  end subroutine print_values

end module diffusion
