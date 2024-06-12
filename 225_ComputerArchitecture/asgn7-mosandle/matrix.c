/*
 * Defines functions for manipulating square integer matrices.
 * CSC 225, Assignment 7
 * Given code, Fall '20
 */

#include "matrix.h"

/* matscl: Multiplies each element of a matrix by a scalar. */
void matscl(int *mat, unsigned int n, int c) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mat - A pointer to the first element in a multidimensional array
     *  n   - The height and width of the matrix
     *  c   - The constant scalar
     * ...multiply each element in "mat" by "c". */

        /* for each element in the multidimensional array*/
        /* go into the sub array*/
        /*  multiply each element in the array times the scaler */
        int i;

        for(i = 0; i < n*n; i++){
            mat[i] = mat[i] * c;
        }
            
}/*end of function one*/

/* matpscl: Multiplies each element of a matrix by a scalar. */
void matpscl(int **mat, unsigned int n, int c) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mat - An array of pointers to arrays of integers
     *  n   - The height and width of the matrix
     *  c   - The constant scalar
     * ...multiply each element in "mat" by "c". */

        /* for each element in the multidimensional array*/
        /* go into the sub array*/
        /*  multiply each element in the array times the scaler */

        int i;
        int j;

        for(i = 0; i < n; i++){
            for(j = 0; j < n; j++){
                mat[i][j] = mat[i][j] * c;
            }
        }
}

/* mattrn: Transposes a matrix about its diagonal, in-place. */
void mattrn(int *mat, unsigned int n) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mat - A pointer to the first element in a multidimensional array
     *  n   - The height and width of the matrix
     * ...transpose "mat" about its diagonal. */


        int i;
        int j;

        for(i = 0; i < n; i++){
            for(j = 0; j < n; j++){
                
                if(i > j){
                
                int temp = mat[i * n + j];
                mat[i * n + j] = mat[j * n + i];
                mat[j * n + i] = temp;
                }
         }
        }
}

/* matptrn: Transposes a matrix about its diagonal, in-place. */
void matptrn(int **mat, unsigned int n) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mat - An array of pointers to arrays of integers
     *  n   - The height and width of the matrix
     * ...transpose "mat" about its diagonal. */

        int i;
        int j;

        for(i = 0; i < n; i++){
            for(j = 0; j < n; j++){
                
                if(i > j){
                
                int temp = mat[i][j];
                mat[i][j] = mat[j][i];
                mat[j][i] = temp;
                }
            }
        }
}

/* matadd: Adds two matrices, placing their sum into a third. */
void matadd(int *mata, int *matb, int *matc, unsigned int n) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mata - A pointer to the first element in a multidimensional array
     *  matb - A pointer to the first element in a multidimensional array
     *  matc - A pointer to the first element in a multidimensional array
     *  n    - The height and width of the matrices
     * ...compute "matc = mata + matb". */

    int i;
        for(i = 0; i < n*n; i++){
                matc[i] = matb[i] + mata[i];
        }
}

/* matpadd: Adds two matrices, placing their sum into a third. */
void matpadd(int **mata, int **matb, int **matc, unsigned int n) { /*PASSED*/
    /* TODO: Complete this function, given:
     *  mata - An array of pointers to arrays of integers
     *  matb - An array of pointers to arrays of integers
     *  matc - An array of pointers to arrays of integers
     *  n    - The height and width of the matrices
     * ...compute "matc = mata + matb". */

    int i;
        int j;

        for(i = 0; i < n; i++){
            for(j = 0; j < n; j++){
                matc[i][j] = matb[i][j] + mata[i][j];
            }
        }
}

/* matmul: Multiplies two matrices, placing their product into a third. */
void matmul(int *mata, int *matb, int *matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - A pointer to the first element in a multidimensional array
     *  matb - A pointer to the first element in a multidimensional array
     *  matc - A pointer to the first element in a multidimensional array
     *  n    - The height and width of the matrices
     * ...compute "matc = mata * matb". */
    
    int i;
    int j;
    int k;
    int temp;

    for(i = 0; i < n; i++){
        for(j = 0; j < n; j++){
            temp = 0;
            for(k = 0; k < n; k++){
                temp += mata[i * n + k] * matb[k * n + j];            
            }
                matc[i * n + j] = temp;
        }
    }



}

/* matpmul: Multiplies two matrices, placing their product into a third. */
void matpmul(int **mata, int **matb, int **matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - An array of pointers to arrays of integers
     *  matb - An array of pointers to arrays of integers
     *  matc - An array of pointers to arrays of integers
     *  n    - The height and width of the matrices
     * ...compute "matc = mata * matb". */

    int i;
    int j;
    int k;
    int temp;

    for(i = 0; i < n; i++){
        for(j = 0; j < n; j++){
            temp = 0;
            for(k = 0; k < n; k++){
                temp += mata[i][k] * matb[k][j];            
            }
                matc[i][j] = temp;
        }
    }

}
