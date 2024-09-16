#ifndef ARRAY_LIST_H
#define ARRAY_LIST_H

typedef struct County {
  char* name; //index 0 
  char* state; //1
  float edu_bachelors; //5
  float edu_hs; //6
  float eth_am_indian; //11
  float eth_asian; //12
  float eth_black; //13
  float eth_hispanic; //14
  float eth_hawaiian; //15
  float eth_two; //16
  float eth_white; //17
  float eth_white_no; //18
  int income_median; //25
  int income_capita; //26
  int income_below_poverty; //27
  int pop_2014; //38
} County;

typedef struct ArrayList {
  int length;
  int capacity;
  County *items;
} ArrayList;

ArrayList *array_list_new();
void check(ArrayList *list);
void array_list_add_to_end(ArrayList *list, County *item);

#endif
