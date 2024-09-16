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
//#include "array_list.h"

typedef struct ArrayList {
  int length;
  int capacity;
  char **items;
} ArrayList;


ArrayList *array_list_new() {
  char **items = malloc(4 * sizeof(char *));
  ArrayList *new_array = malloc(sizeof(ArrayList));
  new_array->length = 0;
  new_array->capacity = 4;
  new_array->items = items;
  return new_array;
}

void array_list_add_to_end(ArrayList *new_array, char *items){
    //if cur length is greater than capacity, realloc
    if(new_array->length < new_array->capacity){
        new_array->items[new_array->length] = malloc(strlen(items) + 1);
        strcpy(new_array-> items[new_array->length], items);
    }
    new_array->capacity = new_array->capacity * 2;
    new_array->items = realloc(new_array-> items, new_array->capacity * sizeof(char *));
}

int cmpfunc(const void *a, const void *b){ //used for qsort to figure out order
    char* one = *(char**)(a);
    char* two = *(char**)(b);
    int result = strcmp(one, two);
    return result; //returns postive, negative, or 0 value
}

void print_stuff(char *name, int level){ //prints the name of the files/dirs formatted with no sizes or hidden
    printf("%*s|-- %s\n", level * 2, "", name); 
    } 

void tree(char *filename, int level, char flag) {
    //printf("hi\n");
    DIR* dir = opendir(filename);
    struct dirent *entry;
    struct stat s;
    char* storage[10];
    int i = 0;
    ArrayList *dirent;
    dirent = newList();
    if (!(dir = opendir(filename))) {
        //printf("what2\n");
        return;
    }
    while ((entry = readdir(dir))) { //while there are more entries to read 
        //printf("hungibug\n");
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) { // ignore . and ..
            continue; 
        }
        array_list_add_to_end(dirent, entry -> d_name);
        i++;
    } 
    qsort(dirent->items, dirent->length, sizeof(char*), cmpfunc);
    chdir(filename);
    closedir(dir);
    
    int j = 0;
    while(j < dirent-> length){
        printf("%s", dirent[j]);
        j++;
    }
    

    
    
    for(int j = 0; j < i; j++){
        // if(flag == 'a'){
        //     //print_stuff(storage[j], level); //should be printing the name
        //     print_size(storage[j], level); //should be printing the name
        // }
        // else if(flag == 's'){
        //     print_size(storage[j], level); //should be printing the name
        // }//end of s
        // else if(flag == 'b'){
        //     print_size(storage[j], level); //should be printing the name
        // }

        // else{
        //     print_stuff(storage[j], level); //should be printing the name
        // }

        char path[4096];
        int len = snprintf(path, sizeof(path)-1, "%s/%s", filename, storage[j]); //makes path
        lstat(path, &s); 

        if(S_ISDIR(s.st_mode)) { //if it's a directory 
            print_stuff(storage[j], level);
            tree(path, level + 1, flag); //recursion
        }//end of if
    }//end of for  loop
}//end of main 

int main(int argc, char *argv[]){
    if(argv[1] == NULL){ //making sure command line argument is given 
        print_stuff(".", 0);
        tree(".", 1, 'n');
    }
    
    for(int i = 1; i < argc; i++){
    //     //printf("test\n");
    //     int result1 = strcmp(argv[i], "-a");
    //     int result2 = strcmp(argv[i], "-s");

    //     if(result1 == 0){
    //         printf("reveal hidden files\n");
    //         //print_stuff_hidden(argv[i], 0);
    //         tree(argv[i], 1, 'a');
    //     }
    //     else if(result2 == 0){
    //         printf("reveal sizes\n");
    //         //print_size(argv[i], 0);
    //         tree(argv[i], 1, 's');
    //     }
    //     else if(result2 != 0 && result1 != 0){
    //     //print_first(argv[i], 0);
    //     print_stuff(argv[i], 0);
    //     tree(argv[i], 1, 'n');
    //     }
    //     else if(result2 == 0 && result1 == 0){
    //     //print_first(argv[i], 0);
    //     //print_stuff_both(argv[i], 0);
    //     tree(argv[i], 1, 'b');
    //     }
    // //print_stuff(argv[i], 0);
    tree(argv[i], 1, 'a');
    }

    //end of for loop
}//end of main 
