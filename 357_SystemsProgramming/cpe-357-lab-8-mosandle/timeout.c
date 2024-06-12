#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <sys/time.h>
#include <netdb.h>
#include <dirent.h>
#include <stdint.h>
#include <string.h>
#include <sys/stat.h>

void validate_args(int argc, int t){
    if(argc < 3) {
        printf("not enough arguments!\n");
        exit(1); }
    if(t < 0) {
        printf("the given amount of seconds must be a positve number\n");
        exit(1); }
}

pid_t pid; //how bad is it to keep this global

pid_t spawn(void){ //precreated to fork and exit to use later, and returns child id
    pid_t pid1 = fork();
    if (pid1 < 0) {
        perror("fork");
        exit(1);
    }
    return pid1;
}

void handle_action(int sig){
    printf("Killing child...\n");
    kill(pid, sig);
    exit(1);
}

void stuff(int signo) {
    struct sigaction action;
    if(sigemptyset(&action.sa_mask) == -1){
        perror("sigemptyset");
        exit(1);
    }
    action.sa_flags = 0;
    action.sa_handler = handle_action;
    if(sigaction(signo, &action, NULL) == -1) {
        perror("sigaction");
        exit(1);
    }
}

void child(char *prog, char *args[]){
    execvp(prog, args);
    printf("something wrong with exec\n");
    exit(1);
}

void process(int seconds, char *command, char **opt){
    stuff(SIGALRM);
    struct itimerval timer;
    timer.it_value.tv_sec = seconds;
    timer.it_value.tv_usec = 0;
    timer.it_interval.tv_sec = 0;
    timer.it_interval.tv_usec = 0;

    if(setitimer(ITIMER_REAL, &timer, NULL) == -1){
        printf("something wrong with timer\n");
        exit(1);
    }

    pid = spawn();
    if(pid == 0){
        child(command, opt);
    }
    int status;
    waitpid(pid, &status, 0);
    if(WIFEXITED(status)){
        printf("Child exited with %d status\n", WEXITSTATUS(status));
    }
}

int main(int argc, char *argv[]){
    validate_args(argc, atoi(argv[1]));
    int time = atoi(argv[1]);

    char *prog = argv[2];
    char **args = &argv[2]; //all args afterwards (optional)

    process(time, prog, args);
    return 0;
}
