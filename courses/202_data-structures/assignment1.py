#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 10 19:40:24 2022

@author: mollysandler
"""
#defines function 
def perm_gen_lex(alph):
    '''returns a list of strings of every permutation of a given string in alphabetical order'''
    
    #defines a new list to be used
    new_list = []
    
    #defines case of if there is a empty list 
    if alph == ' ':
        return []
    
    #defines base case of if length is one 
    if len(alph) == 1:
        return [alph]
    
    #for everything else
    else:
        
        #per each character in the list 
        for item in alph:
            #per each character in smaller recursively called list using replace - nested loop
            #replace returns a new string that replaces the item with a blank space (effectively deleting it)
            for char in perm_gen_lex(alph.replace(item, '')):
                #appends char and item to a new list
                new_list.append(item + char)
    #returns final list with every permutation
    return new_list

#prints the final return statement by calling the function in the main body with the string
string_used = 'abc'
perm_gen_lex(string_used)





