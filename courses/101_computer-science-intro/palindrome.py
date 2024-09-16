#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov  4 13:14:51 2021

@author: mollysandler
"""

lists = ["kayak" ,"zebra" ,"civic" , "apart" ,"madam" ,"stops "]

def is_palindrome(listing):
    molly = [item for item in listing if item[0]==item[4] and item[1] == item[3] in item] 
    return molly


hello = is_palindrome(lists)

print(hello)