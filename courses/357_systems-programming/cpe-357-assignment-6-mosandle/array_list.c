#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "array_list.h"


ArrayList *array_list_new() { 
  County *elements = malloc(4 * sizeof(County));
  ArrayList *list = malloc(sizeof(ArrayList));
  list->length = 0;
  list->capacity = 4;
  list->items = elements;
  return list;
}

void check(ArrayList *list) {
  if (list->length >= list->capacity) {
    list->capacity = list->capacity * 2;
    list->items = realloc(list->items, list->capacity * sizeof(County));
    if (list->items == NULL) {
      exit(1);
    }
  }
}

void array_list_add_to_end(ArrayList *list, County *item){
    check(list);
    if(list->length < list->capacity){
        memcpy(list->items + list->length, item, sizeof(County));
        list->length = list->length + 1;
    }
}
