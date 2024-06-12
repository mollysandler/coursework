#include <stdio.h>
#include "gcd.h"

/*
 * Recursively computes greatest common divisors.
 * CSC 225, Assignment 6
 * Given code, Spring '21
 * TODO: Complete this file.
 */

int main(void) {
    int num1;   
    int num2; 
    int result;

     
    printf("Enter two positive integers: ");
    scanf("%d" "%d" , &num1 , &num2);

    result = gcd(num1, num2);
    printf("gcd(%d, %d) = %d", num1, num2, result);
    printf("\n");
    return result;

}/*end of main*/
