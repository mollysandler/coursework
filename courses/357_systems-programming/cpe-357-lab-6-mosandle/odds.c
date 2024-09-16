#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "odds.h"

void odds(int n){
    for(int i = 1; i <= n; i++){
        if(i % 2 != 0){
            printf("%d\n", i);
        }
    }
        //printf("exit\n");
    exit(0);
    }//end of if statement

int main(int argc, char* argv[]) {
    int j = atoi(argv[1]);
    odds(j);
    /* continue with program logic here */
    return 0;
}
