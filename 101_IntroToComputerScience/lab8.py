#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 16 15:59:48 2021

@author: mollysandler
"""

#TASK ONE
list_den = [2, 3, 4, 0, 5, 6, 8]
list_num = []

while len(list_num) < len(list_den):
    usernum = int(input('please enter a number 10 or greater: '))
    if usernum >= 10:
        list_num.append(usernum)
    elif usernum < 10:
        print('oops! that value does not work, please try again')
        usernum = int(input('please enter a number 10 or greater: '))
print(list_num)

result = []
i = 0
while i < len(list_den):
    if list_den[i] == 0:
        result.append(-1)
        i += 1
    else:
        result.append(list_num[i]/list_den[i])
        i +=1

print(result)
      
      
#TASK TWO 
list_student = ["Hermione", "Ron", "Draco"]

list_marks = [[79, 90, 89], [91, 78, 89], [81, 82, 89]]


i = 0

while i < len(list_student):    
    print(list_student[i])
    avg = 0
    
    for group in list_marks[i]:
        avg = group + avg

    avg = avg / 3
    list_marks[i].sort()

    print(avg)
    print(list_marks[i][-1])
    i = i + 1

          

          

          

          

          