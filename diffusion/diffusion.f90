module diffusion

  implicit none

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

  subroutine initialize_from_file(model, config_file)
    character (len=*), intent (in) :: config_file
    type (diffusion_model), intent (out) :: model

    open(15, file=config_file)
    read(15, *) model%dt, model%t_end, model%n_x, model%n_y
    close(15)
    call initialize(model)
  end subroutine initialize_from_file

  subroutine initialize_from_defaults(model)
    type (diffusion_model), intent (out) :: model

    model%dt = 5.
    model%t_end = 20.
    model%n_x = 10
    model%n_y = 20
    call initialize(model)
  end subroutine initialize_from_defaults

  subroutine initialize(model)
    type (diffusion_model), intent (inout) :: model

    model%t = 0.
    model%dx = 1.
    model%dy = 1.

    allocate(model%density(model%n_x, model%n_y))
    allocate(model%density_tmp(model%n_x, model%n_y))

    model%density = 0.
    model%density_tmp = 0.

    call set_boundary_conditions(model%density)
    call set_boundary_conditions(model%density_tmp)
  end subroutine initialize

  subroutine set_boundary_conditions(z)
    implicit none
    real, dimension (:,:), intent (out) :: z

    integer :: i
    real :: top_x

    top_x = size(z, 1)-1

    do i = 0, size(z, 1)-1
       z(i+1,1) = top_x**2*.25 - (i-top_x*.5)**2
    end do
  end subroutine set_boundary_conditions

  subroutine cleanup(model)
    type (diffusion_model), intent (inout) :: model

    deallocate (model%density)
    deallocate (model%density_tmp)
  end subroutine cleanup

  subroutine advance_in_time(model)
    type (diffusion_model), intent (inout) :: model

    call solve_2d(model)
    model%density = model%density_tmp
    model%t = model%t + model%dt
  end subroutine advance_in_time

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

    do j = 2, model%n_y-1
       do i = 2, model%n_x-1
          model%density_tmp(i,j) = coef * ( &
               dx2*(model%density(i-1,j) + model%density(i+1,j)) + &
               dy2*(model%density(i,j-1) + model%density(i,j+1)) - &
               dx2_dy2_rho )
       end do
    end do
  end subroutine solve_2d

end module diffusion
