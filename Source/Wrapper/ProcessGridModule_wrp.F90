!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!> A wrapper for the process grid module.
MODULE ProcessGridModule_wrp
  USE ProcessGridModule, ONLY : ConstructProcessGrid, DestructProcessGrid, &
       & GetMySlice, GetMyColumn, GetMyRow, global_grid, ProcessGrid_t, &
       & ConstructNewProcessGrid, CopyProcessGrid
  USE WrapperModule, ONLY : SIZE_wrp
  USE ISO_C_BINDING, ONLY : c_int, c_bool
  IMPLICIT NONE
  PRIVATE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> A wrapper for the process grid.
  TYPE, PUBLIC :: ProcessGrid_wrp
     TYPE(ProcessGrid_t), POINTER :: DATA
  END TYPE ProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  PUBLIC :: ConstructGlobalProcessGrid_wrp
  PUBLIC :: ConstructGlobalProcessGrid_onlyslice_wrp
  PUBLIC :: ConstructGlobalProcessGrid_default_wrp
  PUBLIC :: GetGlobalMySlice_wrp
  PUBLIC :: GetGlobalMyColumn_wrp
  PUBLIC :: GetGlobalMyRow_wrp
  PUBLIC :: GetGlobalNumSlices_wrp
  PUBLIC :: GetGlobalNumColumns_wrp
  PUBLIC :: GetGlobalNumRows_wrp
  PUBLIC :: DestructGlobalProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  PUBLIC :: ConstructProcessGrid_wrp
  PUBLIC :: ConstructProcessGrid_onlyslice_wrp
  PUBLIC :: ConstructProcessGrid_default_wrp
  PUBLIC :: CopyProcessGrid_wrp
  PUBLIC :: GetMySlice_wrp
  PUBLIC :: GetMyColumn_wrp
  PUBLIC :: GetMyRow_wrp
  PUBLIC :: GetNumSlices_wrp
  PUBLIC :: GetNumColumns_wrp
  PUBLIC :: GetNumRows_wrp
  PUBLIC :: DestructProcessGrid_wrp
CONTAINS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Wrap the process grid construction routine.
  SUBROUTINE ConstructGlobalProcessGrid_wrp(world_comm_, process_rows_, &
       & process_columns_, process_slices_, be_verbose) &
       & bind(c,name="ConstructGlobalProcessGrid_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    INTEGER(kind=c_int), INTENT(IN) :: process_rows_
    INTEGER(kind=c_int), INTENT(IN) :: process_columns_
    INTEGER(kind=c_int), INTENT(IN) :: process_slices_
    LOGICAL(kind=c_bool), INTENT(IN) :: be_verbose
    CALL ConstructProcessGrid(world_comm_, process_rows_, process_columns_, &
         & process_slices_, be_verbose)
  END SUBROUTINE ConstructGlobalProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Wrap the process grid construction routine.
  SUBROUTINE ConstructGlobalProcessGrid_onlyslice_wrp(world_comm_, &
       & process_slices_, be_verbose) &
       & bind(c,name="ConstructGlobalProcessGrid_onlyslice_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    INTEGER(kind=c_int), INTENT(IN) :: process_slices_
    LOGICAL(kind=c_bool), INTENT(IN) :: be_verbose
    CALL ConstructProcessGrid(world_comm_, process_slices_in=process_slices_, &
         & be_verbose_in=be_verbose)
  END SUBROUTINE ConstructGlobalProcessGrid_onlyslice_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Wrap the process grid construction routine.
  SUBROUTINE ConstructGlobalProcessGrid_default_wrp(world_comm_, be_verbose) &
       & bind(c,name="ConstructGlobalProcessGrid_default_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    LOGICAL(kind=c_bool), INTENT(IN) :: be_verbose
    CALL ConstructProcessGrid(world_comm_, be_verbose_in=be_verbose)
  END SUBROUTINE ConstructGlobalProcessGrid_default_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the slice of the current process.
  FUNCTION GetGlobalMySlice_wrp() RESULT(return_val) &
       & bind(c,name="GetGlobalMySlice_wrp")
    !! Parameters
    INTEGER(kind=c_int) :: return_val
    return_val = GetMySlice()
  END FUNCTION GetGlobalMySlice_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the column of the current process.
  FUNCTION GetGlobalMyColumn_wrp() RESULT(return_val)  &
       & bind(c,name="GetGlobalMyColumn_wrp")
    INTEGER(kind=c_int) :: return_val
    return_val = GetMyColumn()
  END FUNCTION GetGlobalMyColumn_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the row of the current process.
  FUNCTION GetGlobalMyRow_wrp() RESULT(return_val) &
       & bind(c,name="GetGlobalMyRow_wrp")
    INTEGER(kind=c_int) :: return_val
    return_val = GetMyRow()
  END FUNCTION GetGlobalMyRow_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of process slices.
  FUNCTION GetGlobalNumSlices_wrp() RESULT(return_val) &
       & bind(c,name="GetGlobalNumSlices_wrp")
    !! Parameters
    INTEGER(kind=c_int) :: return_val
    return_val = global_grid%num_process_slices
  END FUNCTION GetGlobalNumSlices_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of process columns.
  FUNCTION GetGlobalNumColumns_wrp() RESULT(return_val) &
       & bind(c,name="GetGlobalNumColumns_wrp")
    !! Parameters
    INTEGER(kind=c_int) :: return_val
    return_val = global_grid%num_process_columns
  END FUNCTION GetGlobalNumColumns_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of process rows.
  FUNCTION GetGlobalNumRows_wrp() RESULT(return_val) &
       & bind(c,name="GetGlobalNumRows_wrp")
    !! Parameters
    INTEGER(kind=c_int) :: return_val
    return_val = global_grid%num_process_rows
  END FUNCTION GetGlobalNumRows_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Wrap the process grid construction routine.
  SUBROUTINE DestructGlobalProcessGrid_wrp() &
       & bind(c,name="DestructGlobalProcessGrid_wrp")
    CALL DestructProcessGrid(global_grid)
  END SUBROUTINE DestructGlobalProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Construct a process grid.
  SUBROUTINE ConstructProcessGrid_wrp(ih_grid, world_comm_, process_rows_, &
       & process_columns_, process_slices_) &
       & bind(c,name="ConstructProcessGrid_wrp")
    INTEGER(kind=c_int), INTENT(INOUT) :: ih_grid(SIZE_wrp)
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    INTEGER(kind=c_int), INTENT(IN) :: process_rows_
    INTEGER(kind=c_int), INTENT(IN) :: process_columns_
    INTEGER(kind=c_int), INTENT(IN) :: process_slices_
    TYPE(ProcessGrid_wrp) :: h_grid

    ALLOCATE(h_grid%data)
    CALL ConstructNewProcessGrid(h_grid%data, world_comm_, process_rows_, &
         & process_columns_, process_slices_)
    ih_grid = TRANSFER(h_grid,ih_grid)
  END SUBROUTINE ConstructProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Construct a process grid.
  SUBROUTINE ConstructProcessGrid_onlyslice_wrp(ih_grid, world_comm_, &
       & process_slices_) bind(c,name="ConstructProcessGrid_onlyslice_wrp")
    INTEGER(kind=c_int), INTENT(INOUT) :: ih_grid(SIZE_wrp)
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    INTEGER(kind=c_int), INTENT(IN) :: process_slices_
    TYPE(ProcessGrid_wrp) :: h_grid

    ALLOCATE(h_grid%data)
    CALL ConstructNewProcessGrid(h_grid%data, world_comm_, &
         & process_slices_in=process_slices_)
    ih_grid = TRANSFER(h_grid,ih_grid)
  END SUBROUTINE ConstructProcessGrid_onlyslice_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Construct a process grid.
  SUBROUTINE ConstructProcessGrid_default_wrp(ih_grid, world_comm_) &
       & bind(c,name="ConstructProcessGrid_default_wrp")
    INTEGER(kind=c_int), INTENT(INOUT) :: ih_grid(SIZE_wrp)
    INTEGER(kind=c_int), INTENT(IN) :: world_comm_
    TYPE(ProcessGrid_wrp) :: h_grid

    ALLOCATE(h_grid%data)
    CALL ConstructNewProcessGrid(h_grid%data, world_comm_)
    ih_grid = TRANSFER(h_grid,ih_grid)
  END SUBROUTINE ConstructProcessGrid_default_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Copy a process grid.
  SUBROUTINE CopyProcessGrid_wrp(ih_old_grid, ih_new_grid) &
       & bind(c,name="CopyProcessGrid_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_old_grid(SIZE_wrp)
    INTEGER(kind=c_int), INTENT(INOUT) :: ih_new_grid(SIZE_wrp)
    TYPE(ProcessGrid_wrp) :: h_old_grid
    TYPE(ProcessGrid_wrp) :: h_new_grid

    ALLOCATE(h_new_grid%data)

    h_old_grid = TRANSFER(ih_old_grid,h_old_grid)
    CALL CopyProcessGrid(h_old_grid%data,h_new_grid%data)
    ih_new_grid = TRANSFER(h_new_grid,ih_new_grid)
  END SUBROUTINE CopyProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the slice of the current process.
  FUNCTION GetMySlice_wrp(ih_this) RESULT(return_val) &
       & bind(c,name="GetMySlice_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = GetMySlice(h_this%data)
  END FUNCTION GetMySlice_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the column of the current process.
  FUNCTION GetMyColumn_wrp(ih_this) RESULT(return_val) &
       & bind(c,name="GetMyColumn_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = GetMyColumn(h_this%data)
  END FUNCTION GetMyColumn_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the row of the current process.
  FUNCTION GetMyRow_wrp(ih_this) RESULT(return_val) bind(c,name="GetMyRow_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = GetMyRow(h_this%data)
  END FUNCTION GetMyRow_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of slices in this grid.
  FUNCTION GetNumSlices_wrp(ih_this) RESULT(return_val) &
       & bind(c,name="GetNumSlices_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = h_this%data%num_process_slices
  END FUNCTION GetNumSlices_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of columns in this grid.
  FUNCTION GetNumColumns_wrp(ih_this) RESULT(return_val) &
       & bind(c,name="GetNumColumns_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = h_this%data%num_process_columns
  END FUNCTION GetNumColumns_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Get the number of rows in this grid.
  FUNCTION GetNumRows_wrp(ih_this) RESULT(return_val) &
       & bind(c,name="GetNumRows_wrp")
    INTEGER(kind=c_int), INTENT(IN) :: ih_this(SIZE_wrp)
    INTEGER(kind=c_int) :: return_val
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    return_val = h_this%data%num_process_rows
  END FUNCTION GetNumRows_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !> Destruct a distributed sparse matrix
  SUBROUTINE DestructProcessGrid_wrp(ih_this) &
       & bind(c,name="DestructProcessGrid_wrp")
    INTEGER(kind=c_int), INTENT(INOUT) :: ih_this(SIZE_wrp)
    TYPE(ProcessGrid_wrp) :: h_this

    h_this = TRANSFER(ih_this,h_this)
    CALL DestructProcessGrid(h_this%data)
    DEALLOCATE(h_this%data)
  END SUBROUTINE DestructProcessGrid_wrp
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END MODULE ProcessGridModule_wrp
