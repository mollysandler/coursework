#ifndef ARRAY_LIST_H
#define ARRAY_LIST_H

typedef struct ArrayList {
  int length;
  int capacity;
  char **items;
} ArrayList;

ArrayList *array_list_new();
void check(ArrayList *list);
void array_list_add_to_end(ArrayList *list, char *items);

#endif
