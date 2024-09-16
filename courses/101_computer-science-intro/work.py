#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov  4 15:52:09 2021

@author: mollysandler
"""

import math

#task one DONE
studentGrade = [60, 12, 34, 56, 78]

def calculate_average(grades):
    i = 0
    sum = 0
    while (i < len(grades)):
        sum = sum + grades[i]
        i = i + 1
        average = sum/len(grades)
        grades.sort()
        print(grades)
        print(average)
        return average

calculate_average(studentGrade)

#task two DONE
from palindrome import *

def filter_palindromes(listings):
   newList = [item for item in listings if is_palindrome(new) in hello]
   return newList


#task 3 DONE
import math

num = int(input('please enter a number: '))
def exponent(number):
    i = 0
    exp = 0
    while (i <= 20):
       exp =  exp + ((number**i)/math.factorial(i))
       i = i + 1
    return exp
    
exp1 = exponent(num)
print(exp1)


#task four
hello = ["hello", "racecar", "bottle", "civic", "fun", "kayak"]

def filter_palindromes(anyWord):
   newList = [item for item in anyWord if str(item[::-1]) == item in anyWord]
   print(newList)
   return newList

filter_palindromes(hello)




