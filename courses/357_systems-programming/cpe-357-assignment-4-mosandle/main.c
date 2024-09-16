#define _GNU_SOURCE
#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/resource.h>
#include <sys/wait.h>

#define MAX_NUM_WORDS 4
#define NUM_ARGS 3
#define FILE_IDX 1

void validate_args(int argc, char *argv[]){ //validate args
    if(argc != NUM_ARGS){
        printf("this is not the proper amount of command line arguments\n");
        exit(1);
    }
    //if(argv[2] != atoi(argv[2])){
        //printf("this is not a valid positive integer, try again\n");
       // return;
    //}
    if(atoi(argv[2]) <= 0){
        printf("this is not a valid positive integer, try again\n");
        exit(1);
    }
}//end of vargs

FILE *open_file(char *name){
    FILE *f = fopen(name, "r");
    if(f == NULL){
        perror(name);
        exit(1);
    }
    return f;
}//end of ofile

void check_status(){
    int status;
    pid_t pid;
    pid = wait(&status);
    if((WIFEXITED(status))){
        int exit_status = WEXITSTATUS(status);
        if(exit_status != 0){
            printf("process %d exited abnormally with %d\n", pid, exit_status);
        }
        else{
            printf("process %d finished successfully\n", pid);
        }
    }
    else{
        printf("exited abnormally\n");
    }
}

void run_curl(FILE *in, int n){
    char *word;
    char *line = NULL;
    size_t g;
    char* save[MAX_NUM_WORDS];
    int f_counter = 0;
    int line_counter = 0;


    while(getline(&line, &g, in) > 0){
        line_counter++;
        char *space = line;
        int count = 0;
        while((word = strsep(&space," \t\n\v\r")) != NULL){
            if(strcmp(word, "\0") != 0){
                char *word2 = strdup(word);
                //printf("%d\n", count);
                save[count] = word2;
                count++;
            }//end of tokenizing
        }
        if(f_counter == n){
            check_status();
            f_counter--;
        }
        int fork_check = fork();
        
        if(fork_check < 0){
            perror("fork");
            exit(1);
        }

        if(fork_check == 0){ //child process
            if(count == 2){
                //printf("printing with no time\n");
                execlp("curl", "curl", "-s", "-o", save[0], save[1], NULL);
            }
            else if(count == 3){
                //printf("printing with time %s\n", save[2]);
                execlp("curl", "curl", "-s", "-m", save[2], "-o", save[0], save[1], NULL);
            }
        }//end of child
        else if(fork_check > 0){ //parent process
            f_counter++;
            printf("process %d processing line #%d\n", fork_check, line_counter);
        }

        for(int g = 0; g < count; g++){
            free(save[g]);
        }
    }//end of getline while loop
    for(int j = 0; j < f_counter; j++){
        check_status();
    }
    free(word);
    free(line);
}//end of run curl


int main(int argc, char* argv[]){
    validate_args(argc, argv);
    FILE *file = open_file(argv[FILE_IDX]);
    run_curl(file, atoi(argv[2]));
    fclose(file);
    return 0;
}//end of main
