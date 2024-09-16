#include "checkit.h"
#include "array_list.h"

void test1() {
    ArrayList *list = array_list_new();
    int i;
    for(i = 0; i < 10; ++i){
      array_list_add_to_end(list, "hello");
   }
   char* result = list->items[0];
   char* expected = "hello";
   int amount = list->length;
   int given = 10;
   checkit_string(result, expected);
   checkit_int(amount, given);

   //check element nums = 10
   //check elements hold hello
}

// void test2() {
//    char input[] = "Hello THERE";
//    char result[15];
//    char *expected = "hello there";

//    str_lower_mutate(input);
//    checkit_string(result, expected);
// }

int main(void) {
   test1();
   //test2();
   return 0;
}
