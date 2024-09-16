#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 28 16:27:20 2021

@author: mollysandler
"""

#task one
from datetime import datetime
now = datetime.now()
import random
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(dt_string)

print('Day:' + dt_string[3:5])
print('Month:' + dt_string[0:2])
print('Year:' + dt_string[6:10])
print('Hour:' + dt_string[11:13])
print('Minute:' + dt_string[14:16])
print('Second: ' + dt_string[17:19])



#task two
student1 ="ada lovelace"
student2 = "barbara liskov"
student3 = "grace hopper"
    
x1 = student1[random.randint(0,len(student1) - 1)]
x2 = student1[random.randint(0,len(student1) - 1)]
x3 = student1[random.randint(0,len(student1) - 1)]
x4 = student1[random.randint(0,len(student1) - 1)]
x5 = student1[random.randint(0,len(student1) - 1)]
student1email = x1 + x2 + x3 + x4 + x5 + '@calpoly.edu'
student1email.replace(" ", "")
print(student1email)
    

y1 = student2[random.randint(0,len(student2) - 1)]
y2 = student2[random.randint(0,len(student2) - 1)]
y3 = student2[random.randint(0,len(student2) - 1)]
y4 = student2[random.randint(0,len(student2) - 1)]
y5 = student2[random.randint(0,len(student2) - 1)]
student2email = y1 + y2 + y3 + y4 + y5 + '@calpoly.edu'
student2email.replace(" ", "")
print(student2email)
    
z1 = student3[random.randint(0,len(student3) - 1)]
z2 = student3[random.randint(0,len(student3) - 1)]
z3 = student3[random.randint(0,len(student3) - 1)]
z4 = student3[random.randint(0,len(student3) - 1)]
z5 = student3[random.randint(0,len(student3) - 1)]
student3email = z1 + z2 + z3 + z4 + z5 + '@calpoly.edu'
student3email.replace(" ", "")
print(student3email)

#task 3
a = int(input('enter a number'))
b = int(input('enter another number'))
print(-(-a // b))


#task 4
c = int(input('please enter a celsius temperature'))

f =(c * 1.8) + 32

if 10 < f < 40:
    print('Cold')
elif 41 < f < 79:
    print('Normal')
elif 80 < f < 99:
    print('Hot')
elif f > 100:
    print('Warning: Heat Wave')
else: 
    print('Oops! This temperature oes not work for our system!')
    
#task 5
string = input('please enter a five letter string!')
if len(string) == 5: 
    newstring = string[::-1]
    print(newstring)
    if newstring == string:
        print('This is a palindrome!')
    else: 
        print('This is not a palindrome')
else: 
    print('This is not five letters!')
    
    
    
    
    