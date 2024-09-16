#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb 12 20:40:23 2022

@author: mollysandler
"""

import random
import time

def selection_sort(alist): #selection sort algorithim
    comps = 0 #initializes number of comparisons
    length = len(alist) #defines length 
    for slot in range((length -1), 0, -1): #each one in the length of the list minus one
        maxpos = 0 
        for location in range(1,slot+1):
            comps += 1 #increment comparisons 
            if alist[location] > alist[maxpos]: #if current is greater
                maxpos = location #go to that one 
        temp = alist[slot]
        alist[slot] = alist[maxpos]
        alist[maxpos] = temp  #reassign 
        
    return comps #return comparisons
    
def insertion_sort(alist):
    comps = 0 #initializes number of comparisons
    length = len(alist) #defines length
    for index in range(1,length): #each one 
        currentvalue = alist[index]
        position = index
        
        while position > 0 and alist[position - 1] > currentvalue: 
            comps += 1 #increment comparisons 
            alist[position] = alist[position - 1]
            position = position - 1 #slide!
        if position > 0:
            comps += 1 #increment comparisons 
            alist[position] = currentvalue  
        alist[position] = currentvalue  
    
    return comps #return amount of comparisons 

   
def main():
    # Give the random number generator a seed, so the same sequence of 
    # random numbers is generated at each run
    random.seed(1234) 
    
    # Generate 5000 random numbers from 0 to 999,999
    randoms = random.sample(range(1000000), 2000)
    start_time = time.time() 
    comps = selection_sort(randoms)
    stop_time = time.time()
    print(comps, stop_time - start_time)

if __name__ == '__main__': 
    main()
    
    
    
    
    
    
    