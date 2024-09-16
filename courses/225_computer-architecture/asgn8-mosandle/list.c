/*
 * Defines functions for linked lists.
 * CSC 225, Assignment 8
 * Given code, Spring '21
 */

#include <stdlib.h>
#include "list.h"

/* lstcreate: Creates an empty linked list. */
List *lstcreate() {
    /* TODO: Complete this function, given no arguments:
     * ...return a pointer to a new, dynamically allocated List structure. */
    List *list = (List *)(malloc(sizeof(List)));
    list -> head = NULL;
    list -> size = 0;
    return list;
}

/* lstdestroy: Destroys an existing linked list. */
void lstdestroy(List *lst) {
    /* TODO: Complete this function, given:
     *  lst - A pointer to a List structure
     * ...deallocate all memory associated with "lst". */

    Node *current = lst -> head;
    Node *temp = NULL;

    while(current != NULL){
        temp = current -> next;
        free(current);
        current = temp;
    }
    free(lst);
}

/* lstsize: Computes the size of a linked list. */
unsigned int lstsize(List *lst) {
    /* TODO: Complete this function, given:
     *  lst - A pointer to a List structure
     * ...return the number of nodes in "lst". */
    return lst -> size;
}

/* lstget: Gets an element in a linked list at an index. */
void *lstget(List *lst, unsigned int idx) {
    /* TODO: Complete this function, given:
     *  lst - A pointer to a List structure
     *  idx - A non-negative index
     * ...return a pointer to element "idx" of "lst", NULL if "idx" outside
     * the range [0, size - 1] */
    Node *current = lst -> head;
    int counter = 0;
    while(current != NULL){

        if(counter == idx){
            return current -> value;
        }
        else{
            current = current -> next;
            counter = counter + 1;
        }
    } 
    return NULL;
}

/* lstset: Sets an element in a linked list at an index. */
int lstset(List *lst, unsigned int idx, void *value) {
    /* TODO: Complete this function, given:
     *  lst   - A pointer to a List structure
     *  idx   - A non-negative index
     *  value - A pointer to a desired element
     * ...set element "idx" of "lst" to "value"; return 0 on success, 1 if
     *  "idx" outside the range [0, size - 1]. */
    
    Node *current = lst -> head;
    int counter = 0;
    while(current != NULL){

        if(counter == idx){
            current -> value = value;
            return 0;
        }
        else{
            current = current -> next;
            counter = counter + 1;
        }
    } 
    return 1;
}

/* lstadd: Adds an element to a linked list at an index. */
int lstadd(List *lst, unsigned int idx, void *value) {
    /* TODO: Complete this function, given:
     *  lst   - A pointer to a List structure
     *  idx   - A non-negative index
     *  value - A pointer to a desired element
     * ...add "value" as element "idx" of "lst"; return 0 on success, 1 if
     * "idx" outside the range [0, size]. */

    Node *current = lst -> head;

    int counter = 0;

    if(idx == 0){
        Node *new = (Node *)(malloc(sizeof(Node)));
        new -> value = value;
        new -> next = lst -> head;
        lst -> head = new;
        lst -> size ++;

        return 0;
    }       
    
    
    while(current != NULL){
        if(counter == idx -1){
            Node *new = (Node *)(malloc(sizeof(Node)));
            new -> value = value;
            new -> next = current -> next;

            current -> next = new;
            lst -> size ++;
            return 0;
        }

        else{
            current = current -> next;
            counter = counter + 1;
        }
    } 
    return 1;
}


/* lstremove: Removes an element from a linked list at an index. */
void *lstremove(List *lst, unsigned int idx) {
    /* TODO: Complete this function, given:
     *  lst - A pointer to a List structure
     *  idx - A non-negative index
     * ...remove element "idx" of "lst"; return a pointer to the removed
     * element, NULL if "idx" outside the range [0, size - 1]. */

    Node *current = lst -> head;
    Node *old;
    void *hello;


    int counter = 0;
    if(lst -> size == 0){
        return NULL;
    }

    if(idx == 0){
        old = lst -> head;
        lst -> head = old -> next;
        hello = old -> value;
        free(old);
        lst -> size -- ;

        return hello;
    }       
    
    
    while(current != NULL){
        if(counter == idx -1){

            old = current -> next;
            current -> next = old -> next;
            hello = old -> value;
            free(old);
            lst -> size -- ;

            return hello;
        }

        else{ 
            current = current -> next;
            counter = counter + 1;
        }
    } 
    return NULL;
}


/* lsttoarr: Creates an array from a linked list. */
void **lsttoarr(List *lst) {
    /* TODO: Complete this function, given:
     *  lst - A pointer to a List structure
     * ...return a dynamically allocated array of void pointers containing the
     * elements of "lst", in the same order. */
    void ** array = malloc(sizeof(void *) * (lst -> size));
    
    Node *current = lst -> head;
    int counter = 0;
    while(current != NULL){
        array[counter] = current -> value;
        current = current -> next;
        counter = counter + 1;
    } 
    return array;
}


/* arrtolst: Creates a linked list from an array. */
List *arrtolst(void **arr, unsigned int n) {
    /* TODO: Complete this function, given:
     *  arr - An array of void pointers
     *  n   - The length of the given array
     * ...return a pointer to a new, dynamically allocated list containing the
     * elements of "arr", in the same order. */
    int i;
    List *list = lstcreate(); 
    for(i = 0; i < n; i ++){
        lstadd(list, i, arr[i]);
    }
    return list;
}
