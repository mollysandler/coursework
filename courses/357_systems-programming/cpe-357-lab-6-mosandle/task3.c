#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h> 
#include "odds.h"
#include "evens.h"


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

void fe_test(char* n){
    char *arg1 = n;
    int mypid = fork();
    if(mypid == 0){ //child printing odd
        execl("./odds", "odds", arg1, (char *)NULL);
        //printf("exit\n");
        exit(0);
    }//end of if statement
    else{ //parent printing even
        if(fork() == 0){
            execl("./evens", "evens", arg1, (char *)NULL);
            exit(0);
        }
        //execvp("./evens.o", &arg1);
        wait(0);
        wait(0);
        exit(0);
    } 
}//end of fe_test

int main(int argc, char* argv[]){
    limit_fork(600);
    char* j = argv[1];
    fe_test(j);
    return 0;
}
