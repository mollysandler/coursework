#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

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

void count_stuff(FILE *in){
    int c;
    int char_count = 0;
    int word_count = 0;
    int line_count = 0;
    char last = NULL;
    c = fgetc(in);

    if(c == EOF){
        printf("%d \n", char_count);
        printf("%d \n", word_count);
        printf("%d \n", line_count);
        exit(0);
    }
    while(c != EOF){
        char_count++;
        
        if(c == '\n'){
            line_count++;
        }//end of newline if statement

        if(!isspace(c)){
            if(last == 0 || isspace(last)){
                word_count++;
            }
        }//end of spaces if statement 
            
        last = c;
        c = fgetc(in);
        
    }//end of big while loop

    printf("%d \n", char_count);
    printf("%d \n", word_count);
    printf("%d \n", line_count);
}


int main(int argc, char *argv[]){
    validate_args(argc, argv);
    if(argc == 2){
        FILE *in = open_file(argv[FILE_IDX]);
    count_stuff(in);
    fclose(in);
    }//end of if file given 
    
    else{
        count_stuff(stdin);
    }

    return 0;
}//end of main 