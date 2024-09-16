#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "array_list.h"

ArrayList *array_list_new() { //from lab 4 for arraylist
  char **elements = malloc(4 * sizeof(char *));
  ArrayList *list = malloc(sizeof(ArrayList));
  list->length = 0;
  list->capacity = 4;
  list->items = elements;
  return list;
}

void check(ArrayList *list) {
  if (list->length >= list->capacity) {
    list->capacity = list->capacity * 2;
    list->items = realloc(list->items, list->capacity * sizeof(char));
    if (list->items == NULL) {
      exit(1);
    }
  }
}

void array_list_add_to_end(ArrayList *list, char *items){
    if(list->length < list->capacity){
        list->items[list->length] = malloc(strlen(items) + 1);
        strcpy(list-> items[list->length], items);
        list->length = list->length + 1;
    }
    list->capacity = list->capacity * 2;
    list->items = realloc(list-> items, list->capacity * sizeof(char *));
}
