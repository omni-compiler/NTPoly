#ifndef EIGENSOLVERS_ch
#define EIGENSOLVERS_ch

void ReferenceEigenDecomposition_wrp(const int *ih_this, int *ih_eigenvectors,
                                const int *ih_solver_parameters);
void SplittingEigenDecomposition_wrp(const int *ih_this, int *ih_eigenvectors,
                                     int *ih_eigenvalues, int *num_values,
                                     const int *ih_solver_parameters);
void SingularValueDecompostion_wrp(const int *ih_this, int *ih_leftvectors,
                                   int *ih_rightvectors, int *ih_singularvalues,
                                   const int *ih_solver_parameters);
#endif
