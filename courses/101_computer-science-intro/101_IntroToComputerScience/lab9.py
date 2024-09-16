#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 17 22:06:14 2021

@author: mollysandler
"""

#task one FIX UNIT TESTING
#initializes list
heart_rate = [ [ 72, 75, 71, 73], [ 91, 90, 94, 93],[ 130, 135, 139, 142],[ 120, 118, 110, 105, 100, 98]]

#defines function
def calculate_average_heart_rates(heart_rate):
    newList =[]
    for group in heart_rate:
        total = 0
        for item in group:
            total = total + item
        average = total/len(group)
        newList.append(average)
        
    return newList
#calls the function with the list as its parameter and prints the new list
print(calculate_average_heart_rates(heart_rate))

#task twoDONE
#initializes list of students
list_student=["Jack", "Jill", "Mike"]

#initializes list of grades
list_marks = [[79, 90, 89], [91, 78, 89], [81, 82, 89]]

i = 0
#while the index is less than 3
while i < len(list_student):    
    print(list_student[i])
    avg = 0
    #for each group in the list of grades
    for group in list_marks[i]:
        avg = group + avg
    #gets the average
    avg = avg / 3
    #sorts each list of grades so highest score is last
    list_marks[i].sort()
    #prints average
    print(avg)
    #prints highest score
    print(list_marks[i][-1])
    i = i + 1
    
# task three DONE
#version one
#initializes list
list_nums = [11, 68, 5, 77, 23, 135]
#prints list
print(list_nums)
#sorts list
list_nums.sort()
#prints sorted list
print(list_nums)



nums = [11, 68, 5, 77, 23, 135]

for i in range(len(nums)):
            small = i
            var = i
            while var + 1 < len(nums):
                var = var + 1
                j = var
                if nums[small] > nums[j]:
                    small = j
            if small != i:
                nums[small], nums[i] = nums[i], nums[small]   
print(nums)









