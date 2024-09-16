#define _GNU_SOURCE
#define ARR_SIZE 1024

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

void *checked_malloc (size_t size) {
    int *p;
    p = malloc(size);
    if(p == NULL){
        perror("malloc");
        exit(1);
    }
    return p;
}

char *uint32_to_str(uint32_t i){
    //WRITE DOWN CHECKED MALLOC LATER
    int length = snprintf(NULL, 0, "%lu", (unsigned long)i);       // pretend to print to a string to get length
    char* str = checked_malloc(length + 1);                        // allocate space for the actual string
    snprintf(str, length + 1, "%lu", (unsigned long)i);            // print to string
    return str;
}

void ls_(uint32_t dir_tracker){ //ls function 
    int dr = 1;
    char name[33];
    uint32_t index;
    char *stringing = uint32_to_str(dir_tracker);
    FILE *dir_file = fopen(stringing, "r"); //open current directory
    
    while(dr > 0){
        dr = fread(&index, sizeof(uint32_t), 1, dir_file); //put indices in index
        if(dr == 0){
            break;
        }
        dr = fread(&name, sizeof(char), 32, dir_file); //put names in name
        printf("%d %s\n", index, name); //print index and name of files in directory
    }//end of while loop
    fclose(dir_file);
    free(stringing);
}//end of ls function 

void mkdir_(char* name, uint32_t* dir_tracker, char inodes[]){ //make directory function
    int dr = 1;
    uint32_t new_dir_index = 0;
    uint32_t index;
    char chars[33];    
    char *stringing = uint32_to_str(*dir_tracker);    
    FILE *dir_file = fopen(stringing, "r+"); //read through whole thing and then write to the bottom

    while(inodes[new_dir_index] != '\0'){ //find first open inode spot
        new_dir_index++;
    }
    inodes[new_dir_index] = 'd'; //assign that to a directory character

    while(dr > 0){
        dr = fread(&index, sizeof(uint32_t), 1, dir_file);
        if(dr == 0){
            break;
        }
        dr = fread(&chars, sizeof(char), 32, dir_file);
        //printf("%d %s\n", index, chars);
        
        if(strcmp(chars, name) == 0){ //if file already exists
            //printf("%d\n", index);
            printf("sorry there is already an entry in this directory with this name\n");
            return;
        }
    }//end of while loop

    //need to write in the . and .. values but idk how to do that
    int writing; //if file does not already exist 
    writing = fwrite(&new_dir_index, sizeof(uint32_t), 1, dir_file); //write name and index to current directory
    writing = fwrite(name, sizeof(char), 32, dir_file);  

    FILE* filefile;
    char *new = uint32_to_str(new_dir_index); //making the new directory
    filefile = fopen(new, "w");
    fwrite(&new_dir_index, sizeof(uint32_t), 1, filefile); //write name and index to mew directory
    fwrite(".", sizeof(char), 32, filefile); //making the . and .. work
    fwrite(dir_tracker, sizeof(uint32_t), 1, filefile); 
    fwrite("..", sizeof(char), 32, filefile);

    fclose(filefile); //close the files
    fclose(dir_file);
    free(stringing);
    free(new);
}//end of mkdir

void exit_(char inodes[]){ //need to save everything in here
    int i = 0;
    FILE* inodes_file = fopen("inodes_list", "w");
    for(i; i < ARR_SIZE; i++){
        if(inodes[i] == '\0'){ //if null, dont do anything
            continue;
        }
        else{
            fwrite(&i, sizeof(uint32_t), 1, inodes_file); //save everything in inodes_list
            fwrite(&inodes[i], sizeof(char), 1, inodes_file); 
        }
    }
    fclose(inodes_file);
    exit(0);
}//end of exit

void cd_(char* name, uint32_t* dir_tracker, char inodes[]){ //cd function
    int fr = 1;
    uint32_t index;
    char chars[33];
    char *stringing = uint32_to_str(*dir_tracker);
    FILE *dir_file = fopen(stringing, "r");
    int found = 0;

    while(fr > 0){
        fr = fread(&index, sizeof(uint32_t), 1, dir_file);
        if(fr == 0){
            break;
        }
        fr = fread(&chars, sizeof(char), 32, dir_file);
        //printf("%d %s\n", index, chars);
        if(strcmp(chars, name) == 0){
            found = 1;
            //printf("%d\n", index);
            break;
        }
    }//end of while loop
    if(found != 1){
        printf("Directory not found :(\n");
        return;
    }
    if(inodes[index] == 'f'){
        printf("sorry this is not a directory\n");
        return;     
    }
    else{
        //printf("changing directory\n");
        *dir_tracker = index;
    }//end of while loop
    fclose(dir_file);
    free(stringing);
}//end of cd

void touch_(char* name, uint32_t* dir_tracker, char inodes[]){ //touch function
    int dr = 1;
    uint32_t i = 0;
    uint32_t index;
    char chars[33];
    char *stringing = uint32_to_str(*dir_tracker);
    FILE *dir_file = fopen(stringing, "r");
    while(inodes[i] != '\0'){ //find first open inode spot
        i++;
    }
    inodes[i] = 'f'; //assign that to a file character

    while(dr > 0){
        dr = fread(&index, sizeof(uint32_t), 1, dir_file);
        if(dr == 0){
            break;
        }
        dr = fread(&chars, sizeof(char), 32, dir_file);
        //printf("%d %s\n", index, chars);
        
        if(strcmp(chars, name) == 0){ //if file already exists
            //printf("%d\n", index);
            return;
        }
    }//end of while loop
    fclose(dir_file);
    dir_file = fopen(stringing, "a");
    int writing; //if file does not already exist    
    writing = fwrite(&i, sizeof(uint32_t), 1, dir_file);
    writing = fwrite(name, sizeof(char), 32, dir_file);
    fclose(dir_file);

    FILE* filefile;
    char *new = uint32_to_str(i);
    filefile = fopen(new, "w");
    fwrite(name, sizeof(char), 32, filefile); //write the name into the file
    fclose(filefile);
    
    free(stringing);
    free(new);
    }

int main(int argc, char *argv[]){
    char inodes[ARR_SIZE];
    memset(inodes, 0, ARR_SIZE);

    FILE *inode_file;
    char *line_buf = NULL;
    char *line_buf_two = NULL;
    size_t line_buf_size = 0;
    uint32_t dir_tracker = 0;
    char *word;
    char ftype; 
    uint32_t index;

    char *array[ARR_SIZE];
    int dr = 1;
    int i = 0;

    if(argv[1] == NULL){ //making sure command line argument is given 
        printf("please try again and enter something the proper command line arguments\n");
        return 1;
    }
    else{
        chdir(argv[1]); 
    }

    inode_file = fopen("inodes_list", "r");
    if(inode_file == NULL){ //making sure it contains inodes list
        printf("this file does not contain inodes_list, try again\n");
        return 1;
    }

    while(dr > 0){
        dr = fread(&index, sizeof(uint32_t), 1, inode_file);
        if(dr == 0){
            break;
        }
        dr = fread(&ftype, sizeof(char), 1, inode_file);
        inodes[index] = ftype;
    }//end of while loop
    fclose(inode_file);

    while(getline(&line_buf, &line_buf_size, stdin) > 0){
        i = 0;
        line_buf_two = line_buf;
        while((word = strsep(&line_buf_two," \t\n\v\r")) != NULL){
            array[i] = word;
            i = i + 1;
        }//end of tokenizing loop
        //free(word);

        //individual calls below
        if((strcmp(array[0], "ls")) == 0){
            ls_(dir_tracker);
        }
        if((strcmp(array[0], "exit")) == 0){
            free(word);
            free(line_buf);
            exit_(inodes);
        }
        if((strcmp(array[0], "cd")) == 0){
            cd_(array[1], &dir_tracker, inodes);
        }
        if((strcmp(array[0], "touch")) == 0){
            touch_(array[1], &dir_tracker, inodes);
        }
        if((strcmp(array[0], "mkdir")) == 0){
            mkdir_(array[1], &dir_tracker, inodes);
        }
    }//end of big while loop
    free(word);
    free(line_buf);
    exit_(inodes);
}//end of main 