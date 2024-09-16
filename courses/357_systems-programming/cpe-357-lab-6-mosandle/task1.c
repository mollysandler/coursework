#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
//#include "f_test.h"

void limit_fork(rlim_t max_procs) {
    struct rlimit rl;
    if (getrlimit(RLIMIT_NPROC, &rl))
    {
        perror("getrlimit");
        exit(-1);
    }
    rl.rlim_cur = max_procs;
    if (setrlimit(RLIMIT_NPROC, &rl))
    {
        perror("setrlimit");
        exit(-1);
    }
}

void f_test(int n){
    int i;
    int mypid = fork();
    if(mypid == 0){ //child printing odd
        for(int i = 1; i <= n; i++){
            if(i % 2 != 0){
                printf("%d\n", i);
            }
        }
        //printf("exit\n");
        exit(0);
    }//end of if statement
    
    else{ //parent printing even
        for(int i = 1; i <= n; i++){
            //printf("hello\n");
            if(i % 2 == 0){
                printf("\t%d\n", i);
            }
        }
    }
    wait(0);
    //printf("hello\n");
    exit(0);
} 

int main(int argc, char* argv[]) {
    limit_fork(600);
    int j = atoi(argv[1]);
    f_test(j);
    /* continue with program logic here */
    return 0;
}
