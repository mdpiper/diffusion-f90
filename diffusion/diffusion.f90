module diffusion

  implicit none

  type :: diffusion_model
     private
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

    call setBC(model%density)
    call setBC(model%density_tmp)
  end subroutine initialize

  subroutine setBC (z)
    implicit none
    real, dimension (:,:), intent (out) :: z

    integer :: i
    real :: top_x

    top_x = size(z, 1)-1

    do i = 0, size(z, 1)-1
       z(i+1,1) = top_x**2*.25 - (i-top_x*.5)**2
    end do
  end subroutine setBC

  subroutine cleanup(model)
    type (diffusion_model), intent (inout) :: model

    deallocate (model%density)
    deallocate (model%density_tmp)
  end subroutine cleanup

  ! subroutine solve_2d()
  ! end subroutine solve_2d

  ! subroutine advance_in_time()
  ! end subroutine advance_in_time

end module diffusion
