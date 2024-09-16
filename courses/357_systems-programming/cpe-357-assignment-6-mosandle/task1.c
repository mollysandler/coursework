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
#include "array_list.h"
#include "ops.h"

#define NUM_ARGS 3 //the file being run, the data set file, and the a file to execute on the data

FILE *open_file(char *name){
    FILE *f = fopen(name, "r");
    if(f == NULL){
        perror(name);
        return f;
    }
    return f;
}//end of ofile

void validate_args(int argc, char* argv[]){ 
    if(argc != NUM_ARGS){ 
        printf("Sorry, you have not entered the correct amount of arguments, please try again\n");
        exit(1);
    }//end of num args if
    FILE *f = open_file(argv[1]); //checkingn argv1 is a valid and accessible file
    if(f == NULL){
        printf("this file is not available to you, please try again\n");
        fclose(f);
        exit(1);

    }
    fclose(f);
    FILE *fi = open_file(argv[2]); //checking argv2 is a valid and accessible file
    if(fi == NULL){
        printf("this file is not available to you, please try again\n");
        fclose(fi);
        exit(1);
    }
    fclose(fi);
}//end of validate args

int create_county_struct(ArrayList *arraylist, char* line){
    char *word;
    char *space = line;
    int count = 0;
    County county;
    while((word = strsep(&space,",\"")) != NULL){           
        if(strcmp(word, "\0") != 0){
            if(count == 0){
                county.name = strdup(word);
            }//for first line only
            else if(count == 1){
                county.state = strdup(word);
            }
            else if(count == 5){
                county.edu_bachelors = atof(word);
            }
            else if(count == 6){
                county.edu_hs = atof(word);
            }
            else if(count == 11){
                county.eth_am_indian = atof(word);
            }
            else if(count == 12){
                county.eth_asian = atof(word);
            }
            else if(count == 13){
                county.eth_black = atof(word);
            }
            else if(count == 14){
                county.eth_hispanic = atof(word);
            }
            else if(count == 15){
                county.eth_hawaiian = atof(word);
            }
            else if(count == 16){
                county.eth_two = atof(word);
            }
            else if(count == 17){
                county.eth_white = atof(word);
            }
            else if(count == 18){
                county.eth_white_no = atof(word);
            }
            else if(count == 25){
                county.income_median = atoi(word);
            }
            else if(count == 26){
                county.income_capita = atoi(word);
            }
            else if(count == 27){
                county.income_below_poverty = atoi(word);
            }
            else if(count == 38){
                county.pop_2014 = atoi(word);
            }
            count++;
        }//end of tokenizing
    }
    //printf("%d", count);
    if(count != 53){ //52 is total amount of headers
            return 1;
        }
    array_list_add_to_end(arraylist, &county);
    return 0;
}

//make functions with each of the requirements and pass through the arraylist to clarify 

ArrayList* process(char* file_name){ //taking in argv1 to process
    ArrayList *arraylist = array_list_new();
    //int entry_count = 0; //total number of entries loaded
    int line_count = 0; // which line is currently being read aka the total amount of lines by the end
    char* line = NULL;
    size_t h; 
    FILE *f = open_file(file_name);
    if(f != NULL){ //READING EACH LINE FROM THE FILE
        while(getline(&line, &h, f) > 0){ //does this stuff per each line aka each county
            if(line_count != 0){
                if(create_county_struct(arraylist, line) == 1){
                    fprintf(stderr, "something went wrong on line %d\n", line_count);
                }
            }
            line_count++;
        }//end of getline
        free(line);
        //percent_field(arraylist, "Ethnicities.Hispanic or Latino");
        //     printf("%d\n", arraylist -> items[i].pop_2014);
        // }
    }
    fclose(f);
    printf("the total amount of loaded entries is %d\n", arraylist -> length);
    return arraylist;
    //tokenizing each line entry
}//END OF PROCESS

void read_ops(ArrayList *arraylist, char* name){
    FILE* file = open_file(name);
    char *word;
    int line_count = 0;
    char* line = NULL;
    char* save[5];
    size_t h; 
    while(getline(&line, &h, file) > 0){ //does this stuff per each line aka each function
        int count = 0;        
        char *space = line;
        while((word = strsep(&space, ":")) != NULL){           
            if(strcmp(word, "\0") != 0){
                char* word2 = strdup(word);
                save[count] = word2;
                count++;
            }//end of tokenize
        }
        if(strcmp(save[0], "display") == 0){
            display(arraylist);
        }
        if(strcmp(save[0], "filter_state") == 0){
            filter_state(arraylist, save[1]);
        }
        if(strcmp(save[0], "filter") == 0){
            filter(arraylist, save[1], save[2], atof(save[3]));
        }
        if(strcmp(save[0], "population_total") == 0){
            population_total(arraylist);
        }
        if(strcmp(save[0], "population") == 0){
            population(arraylist, save[1]);
        }
        if(strcmp(save[0], "percent") == 0){
            percent(arraylist, save[1]);
        }
    }
    line_count++;
    free(line);
    fclose(file);
}

int main(int argc, char* argv[]){
    validate_args(argc, argv);
    ArrayList *arraylist = process(argv[1]); //argv1 is the csv file
    read_ops(arraylist, argv[2]);
}
