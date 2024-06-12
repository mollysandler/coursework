#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "evens.h"

void evens(int n){
    for(int i = 1; i <= n; i++){
        //printf("hello\n");
        if(i % 2 == 0){
            printf("\t%d\n", i);
        }
    }       
    exit(0);
}

int main(int argc, char* argv[]) {
    int j = atoi(argv[1]);
    evens(j);
    /* continue with program logic here */
    return 0;
}
