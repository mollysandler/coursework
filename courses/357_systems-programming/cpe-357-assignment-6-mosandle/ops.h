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

void display(ArrayList *arraylist);
ArrayList* filter_state(ArrayList *arraylist, char* abb);
void filter(ArrayList *arraylist, char* field, char* gl, float number);
int population_total(ArrayList *arraylist);
int population(ArrayList *arraylist, char* field);
void percent(ArrayList *arraylist, char* field);
