  CALL GatherMatrixToProcess(this, local_mat, 0)

  IF (IsRoot(this%process_grid)) THEN
     IF (PRESENT(file_name_in)) THEN
        CALL PrintMatrix(local_mat, file_name_in)
     ELSE
        CALL PrintMatrix(local_mat)
     END IF
  END IF

  CALL DestructMatrix(local_mat)
