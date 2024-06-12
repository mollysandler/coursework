#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h> 
#include <fcntl.h>


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

void func(char* file_run, char* file_new){
    if(fork() == 0) {
        int fd = open(file_new, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
        dup2(fd, 1);
        close(fd);
        execlp(file_run, file_run, NULL);
        exit(0);
    }
    else{
        wait(0);
    }
   
}//end of func

int main(int argc, char* argv[]){
    limit_fork(600);
    func(argv[1], argv[2]);
    return 0;
}
