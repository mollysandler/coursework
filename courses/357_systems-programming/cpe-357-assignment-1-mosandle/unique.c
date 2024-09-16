#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define _GNU_SOURCE

#define FILE_IDX 1
#define NUM_ARGS 2
#define NUM_NO_FILE 1


void validate_args(int argc, char *argv[]){
    if(argc != NUM_ARGS && argc != NUM_NO_FILE){
        fprintf(stderr, "usage: %s file \n", argv[0]);
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

void lines(FILE *in){
    char *line = NULL;
    char *last = NULL;
    size_t n;

    while(getline(&line, &n, in) > 0){
        if(last != NULL){
                int result = strcmp(line, last);
                if(result != 0){
                printf(line);
                //printf("%d\n", result);
                }
            free(last);
            }//end of last != null
        else{
            printf(line);
        }
        last = strdup(line);

    }//end of while loop
    free(line);
    free(last);


}//end of lines func


int main(int argc, char *argv[]){
    validate_args(argc, argv);
    if(argc == 2){
        FILE *in = open_file(argv[FILE_IDX]);
    lines(in);
    fclose(in);
    }//end of if file given 
    else{
        lines(stdin);
    }
    return 0;
}//end of main 