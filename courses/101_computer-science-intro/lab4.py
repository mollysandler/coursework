#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 19 12:22:38 2021

@author: mollysandler
"""

#task one
def add(x,y):
    '''function add adds 2 numbers and prints solution'''
    solution = x + y
    return solution

def subtract(x,y):
    '''function subtracts 2 numbers and prints solution'''
    solution = x - y
    return solution

def multiply(x,y):
    '''function mulitplies 2 numbers and prints solution'''
    solution = x * y
    return solution

def divide(x,y):
    '''function divides 2 numbers and prints solution'''
    solution = x / y
    return solution
    
x = int(input("type in your first number: "))
y = int(input("type in your second number: "))
operator = input("type in your operator: ")

'''
these statements determine which operator the user used which then calls the 
respective function for that operator and prints if it is not an option
'''

if not((operator == "+") or (operator == "-") or (operator == "/") or (operator == "*")):
    print("Invalid Operator")
elif (operator == "+"):
    add(x,y)
elif (operator == "-"):
    subtract(x,y)
elif (operator == "*"):
    multiply(x,y)
elif (operator == "/"):
    divide(x,y)
    
    
    
#task two 

'''imports function from other file'''
from untitled3 import is_even

num = int(input("enter a number: "))


'''checks if negative or positive'''
if num < 0:
    negativity = "negative"
else:
    negativity = "positive"

'''checks if even or odd'''
if is_even(num):
    even = "even"
else:
    even = "odd"

'''prints final result'''
print(str(num),"is",negativity,"and",even)


#task three
import math
import sys

'''creates sphere'''
class Sphere:
    x = 0
    y = 0
    z = 0
    radius = 0
    added = x + y + z
    
    def __init__(self,x,y,z,radius,added):
        self.x = x
        self.y = y
        self.z = z
        self.radius = radius
        self.added = added
    
    def volume(self):
        volume = (4/3)* math.pi * (self.radius ** 3)
        return volume

    def __eq__(self, other):
        return self.added == other.added


'''gets user inputs'''
userX1 = float(input("give x1 value: "))
userY1 = float(input("give y1 value: "))
userZ1 = float(input("give z1 value: "))
userRadius1 = float(input("give radius1 value: "))

added1 = userX1 + userY1 + userZ1

userX2 = float(input("give x2 value: "))
userY2 = float(input("give y2 value: "))
userZ2 = float(input("give z2 value: "))
userRadius2 = float(input("give radius2 value: "))

added2 = userX2 + userY2 + userZ2

sphere1 = Sphere(userX1, userY1, userZ1, userRadius1, added1)
sphere2 = Sphere(userX2, userY2, userZ2, userRadius2, added2)

'''does math for final collisions'''
distance = math.sqrt(((userX2 - userX1)**2) + ((userY2 - userY1)**2) + ((userZ2 - userZ1)**2))
    

'''prints results'''
if sphere1 == sphere2:
    print("your spheres are the same")
    sys.exit()

if distance <= sphere1.radius + sphere2.radius:
    print("the two spheres are colliding")
    sys.exit()
else:
    volume1 = sphere1.volume()
    volume2 = sphere2.volume()
    print("spheres are not colliding")
    if volume1 > volume2:
        print("sphere 1 is", str(volume1 - volume2), "bigger than sphere2")
    elif volume2 > volume1:
        print("sphere 2 is", str(volume2 - volume1), "bigger than sphere1")
        
        
        
        
        