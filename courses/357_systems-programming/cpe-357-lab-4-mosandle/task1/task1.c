#include "task1.h"
#include "ctype.h"
#include "string.h"

void str_lower(char *orig, char *copy){
    for(int i = 0; i < strlen(orig); i++){
        int stuff = tolower(orig[i]);
        copy[i] = stuff;
    }
    copy[strlen(orig)] = '\0';
}   

void str_lower_mutate(char *orig){
    for(int i = 0; i < strlen(orig); i++){
        int stuff = tolower(orig[i]);
        orig[i] = stuff;
        orig[strlen(orig)] = '\0';
    }
}
