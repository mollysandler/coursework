#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  6 11:40:53 2021

@author: mollysandler
"""

#task one
import string 
lower =  list(string.ascii_lowercase)
upper = list(string.ascii_uppercase)
name = input('please enter your name ')

if name[0] in upper:
    print('The first letter of the name is upppercase')
elif name[0] in lower:
    print(name.capitalize())
else: 
    print('this name does not begin with a letter')
    
#task two
from datetime import datetime
now = datetime.now()
import random
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")

month = dt_string[0:2]
hour = int(dt_string[11:13])

    
if month == 'December' or month == 'January' or month == 'February':
    print('its winter')
elif month == 'March' or month == 'April' or month == 'May':
    print('its spring')
elif month == 'June' or month == 'July' or month == 'August':
    print('its summer')
else:
    print('its fall')

    
if 6 <= hour < 12:
    print('it is morning')
elif 12 <= hour <= 17:
    print('it is noon')
elif 17 < hour <= 21:
    print('it is evening')
else:
    print('it is night')
    
#task 3
def makeEmail(name):
  name = name.lower()
  x1 = name[random.randint(0,len(name) - 1)]
  x2 = name[random.randint(0,len(name) - 1)]
  x3 = name[random.randint(0,len(name) - 1)]
  x4 = name[random.randint(0,len(name) - 1)]
  x5 = name[random.randint(0,len(name) - 1)]
  studentemail = x1 + x2 + x3 + x4 + x5 + '@calpoly.edu'
  return studentemail
    
user = input('enter your name ')

print(makeEmail(user))

#task four 
import sys

def print_palindrome():
    
    user1 = input("please enter a 5 letter word: ")
    user2 = input("please enter a 5 letter word: ")
    user3 = input("please enter a 5 letter word: ")
    
    if (len(user1) !=5 ) or (len(user2) !=5 ) or (len(user3) != 5):
        print("One or more inputs is not a 5 letter word")
        sys.exit()
        
    def is_palindrome(user):
         newuser = user[::-1]
         if newuser == user :
             Pal = True
             return Pal
         else : 
            Pal = False
            return Pal
        
    is_palindrome(user1)
    is_palindrome(user2)
    is_palindrome(user3)
    
    if ((is_palindrome(user1)) == False) and ((is_palindrome(user2)) == False) and ((is_palindrome(user3)) == False):
        print("no palindromes found!")
        sys.exit()
    elif (is_palindrome(user1)) and (is_palindrome(user2)) and (is_palindrome(user3)):
        print (user1, user2, user3 + " are palindromes")
        sys.exit()
    elif (is_palindrome(user)) and (is_palindrome(user2)) and (is_palindrome(user3) == False):
        print (user1, user2 + " are palindromes")
        sys.exit()
    elif (is_palindrome(user1)) and (is_palindrome(user2) == False) and (is_palindrome(user3)):
        print (user1, user3 + " are palindromes")
        sys.exit()
    elif (is_palindrome(user1) == False) and (is_palindrome(user2)) and (is_palindrome(user3)):
        print (user2, user3 + " are palindromes")
        sys.exit()
    elif (is_palindrome(user1)) and (is_palindrome(user2) == False) and (is_palindrome(user3) == False):
        print (user1 + " is a  palindrome")
        sys.exit()
    elif (is_palindrome(user1) == False) and (is_palindrome(user2)) and (is_palindrome(user3) == False):
        print (user2 + " is a  palindrome")
        sys.exit()
    elif (is_palindrome(user1) == False) and (is_palindrome(user2) == False) and (is_palindrome(user3)):
        print (user3 + " is a  palindrome")
        sys.exit()
print_palindrome()

print_palindrome()
    
    
    
    
    
    
    