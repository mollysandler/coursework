#define _GNU_SOURCE
#define SNPRINTF
#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "array_list.h"
#define NUM_ARGS 1

void validate_args(int argc, char *argv[]){ //validate args
    if(argc < NUM_ARGS){
        fprintf(stderr, "usage: %s file \n", argv[0]);
        exit(1);
    }
}//end of vargs

int get_size(char *name){ //returns size of file
    struct stat s;
    if(stat(name, &s) != 0){
        return 0;
    }
    else {
        int size2 = s.st_size;
        return size2;
    }
}

void print_(char *name, int level, int size){ //print func
    for(int i = 0; i < level -1; i++){
        printf("|  ");
    }
    if(level != 0){ //allow for first one to have no lines
        printf("|-- ");
    }
    
    printf("%s", name); //print filename 
    
    if(size == 1){ //if size flag was called
        int filesize = get_size(name); //call getsize
        printf(" [size: %d]", filesize); //print size stuff
    }
    printf("\n");
}//end of print func

int cmpfunc(const void *a, const void *b){ //used for qsort to figure out order
    char* one = *(char**)(a);
    char* two = *(char**)(b);
    int result = strcmp(one, two);
    return result;
}

void tree(char *filename, int level, int size, int hidden){ //main tree function
    DIR* dir = opendir(filename); 
    struct dirent *entry;
    struct stat s;
    ArrayList *dirent; //using for storage
    dirent = array_list_new();

    while((entry = readdir(dir))) {  
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) { // ignore . and ..
            continue; 
        }
        array_list_add_to_end(dirent, entry -> d_name); //add to array list
    } 

    qsort(dirent->items, dirent->length, sizeof(char*), cmpfunc); //sort array list
    chdir(filename); //go into
    closedir(dir); //close for resources
    
    for(int j = 0; j < dirent->length; j++){ //amount of items in the given directory
        char *new = dirent->items[j];
        
        //printf("%d\n", size);
        if(hidden == 0 && new[0] == '.'){
            continue;
        }

        print_(dirent-> items[j], level, size);
       
        if(stat(dirent->items[j], &s) == 0 && S_ISDIR(s.st_mode) != 0){ //if its a directory
            tree(dirent->items[j], level + 1, size, hidden);
        }
    }
    chdir("..");
}

int main(int argc, char *argv[]){
    struct stat s;
    validate_args(argc, argv);

    int hidden = 0;
    int size = 0;
    int tracker = 0;

    for(int i = 1; i < argc; i++){
        int result1 = strcmp(argv[i], "-a");
        int result2 = strcmp(argv[i], "-s");

        if(result1 == 0){
            hidden = 1;
            continue;
        }
        if(result2 == 0){
            size = 1;
            continue;
        }
        //printf("%d\n", size);
        if(stat(argv[i], &s) != 0){
            tracker = 1;
            printf("this is not a directory or file\n");
            continue;
        }
        print_(argv[i], 0, size); //prints directory and recalls
        tracker = 1;
        if(S_ISDIR(s.st_mode) != 0){ //if its a directory
            tree(argv[i], 1, size, hidden);
        }
    }//end of for loop
    if(tracker == 0){
        print_(".", 0, size); //prints directory and recalls
        tree(".", 1, size, hidden);
    }
    return 0;
}//end of main