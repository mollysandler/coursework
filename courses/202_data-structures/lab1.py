#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan  6 09:15:42 2022

@author: mollysandler
"""

# CPE 202 Lab 1 DONE

def max_list_iter(int_list):  # must use iteration not recursion
   """finds the max of a list of numbers and returns the value (not the index)
   If int_list is empty, returns None. If list is None, raises ValueError"""    
   #defines if list is empty
   if int_list == []:
       return None
   #defines if list does not exist
   elif not int_list :
       raise ValueError('no list present')
   else: 
       #sets current max equal to first item in list
       current_max = int_list[0]
       #if following item is greater, it becomes new currentmax, otherwise it stays 
       for item in int_list:
           if item > current_max:
               current_max = item
       return current_max

#sample list 
list_of_nums = [1, 2, 4, 6, 7, 67, 45, 23, 89, 65]
#sample calling
max_list_iter(list_of_nums)

def reverse_rec(int_list):   # must use recursion
   """recursively reverses a list of numbers and returns the reversed list
   If list is None, raises ValueError"""
   #defines if list does not exist
   if not int_list :
        raise ValueError("no list present")
    #sets variable length equal to the length of the list      
   length = len(int_list)
   #defines base case
   if length == 1 :
       return int_list   
   #runs recursively 
   if length > 1 : 
       int_list.extend(reverse_rec(int_list[0:length-1]))
       del int_list[0: length - 1]
       return int_list
       
#sample list
num_list = [1, 2, 3, 4, 5, 6, 7]
#sample call
reverse_rec(num_list)

'''searches for target in int_list[low..high] and returns index if found
   If target is not found returns None. If list is None, raises ValueError'''
def bin_search(target, low, high, int_list):
    #defines the midpoint 
    mid = (low+high) // 2
   
    #defines if the list does not exist
    if not int_list :
        raise ValueError("no list present")
        
    #defines if the target is not in the list
    if high == low :
        if int_list[mid] != target:
            return None
    
    #defines if the target is the midpoint (base case)
    if int_list[mid] == target:
        return mid 
    
    #runs recursively 
    else:
        #if mid is greater than target, runs from the start of the list to the midpoint index minus one
        if int_list[mid] > target:
            return bin_search (target, low, mid-1, int_list)
        #if mid is less than target, runs from the midpoint index plus one to the end of the list
        if int_list[mid] < target:            
            return bin_search (target, mid+1, high, int_list)
     
#sample sorted list
listing = [1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12]        
#sample code running
bin_search(3, 0, len(listing) - 1, listing)



