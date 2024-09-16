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

int cmpfunc(const void *a, const void *b){
    char* one = *(char**)(a);
    char* two = *(char**)(b);
    int result = strcmp(one, two);
    return result;
}

void print_first(char *name, int level){
    printf("%*s\n", 0, name); //should be printing the name? idk why not
}

void print_stuff(char *name, int level){
    printf("%*s|-- %s\n", level * 2, "", name); //should be printing the name? idk why not
}

void tree(char *filename, int level) {
    //printf("hi\n");
    DIR* dir;
    struct dirent *entry;
    struct stat s;
    char* storage[4096];
    int i = 0;
    if (!(dir = opendir(filename))) {
        //printf("what2\n");
        return;
    }
    while ((entry = readdir(dir))) { //while there are more entries to read 
        //printf("hungibug\n");
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) { // ignore . and ..
            continue; 
        }
        
        storage[i] = entry->d_name;
        i++;
    } 
    closedir(dir);
    
    qsort(storage, i, sizeof(char*), cmpfunc);
    for(int j = 0; j < i; j++){
        print_stuff(storage[j], level); //should be printing the name

        char path[4096];
        int len = snprintf(path, sizeof(path)-1, "%s/%s", filename, storage[j]); //makes path
        lstat(path, &s); 

        if(S_ISDIR(s.st_mode)) { //if it's a directory 
            tree(path, level + 1); //recursion
        
        }//end of if
    }//end of for  loop
}//end of main 

int main(int argc, char *argv[]){
     if(argv[1] == NULL){ //making sure command line argument is given 
        printf("please try again and enter the proper command line arguments\n");
        return 1;
    }
    for(int i = 1; i < argc; i++){
        //printf("test\n");
        int result1 = strcmp(argv[i], "-a");
        int result2 = strcmp(argv[i], "-s");

        if(result1 == 0){
            printf("reveal hidden files\n");
        }
        if(result2 == 0){
            printf("reveal sizes\n");
        }
        if(result2 != 0 && result1 != 0){
        //print_first(argv[i], 0);
        print_stuff(argv[i], 0);
        tree(argv[i], 1);

        }
    }
}//end of main 
