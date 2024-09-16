#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar  6 14:10:42 2022

@author: mollysandler
"""

from hash_quad import *
import string

class Concordance:
    def __init__(self):
        self.stop_table = None  # hash table for stop words
        self.concordance_table = None  # hash table for concordance

    def load_stop_table(self, filename): #works
        """ Read stop words from input file (filename) and insert each word as a key into the stop words hash table.
        Starting size of hash table should be 191: self.stop_table = HashTable(191)
        If file does not exist, raise FileNotFoundError"""
        try: #if file exists 
           f = open(filename, 'r') #open file 
           self.stop_table = HashTable(191) #make a hash table
           
           for line in f: #for each line in the file, aka each word
               self.stop_table.insert(line.strip('\n'), None) #insert each item into table 
           f.close() #close the file 
           
        except FileNotFoundError: #if file does not exist 
           raise FileNotFoundError('oops! this file does not exist')
           
    def load_concordance_table(self, filename): #works but not for dec 
        """ Read words from input text file (filename) and insert them into the concordance hash table, 
        after processing for punctuation, numbers and filtering out words that are in the stop words hash table.
        Do not include duplicate line numbers (word appearing on same line more than once, just one entry for that line)
        Starting size of hash table should be 191: self.concordance_table = HashTable(191)
        Process of adding new line numbers for a word (key) in the concordance:
            If word is in table, get current value (list of line numbers), append new line number, insert (key, value)
            If word is not in table, insert (key, value), where value is a Python List with the line number
        If file does not exist, raise FileNotFoundError"""
        
        try: #if file exists 
           f = open(filename, 'r') #open file 
           self.concordance_table = HashTable(191) #make into hash table
           line_number = 0 #line # is 0 
           
           for line in f: #for line in file
               line_number += 1 #add a line number
               
               for letter in line: 
                   if letter == "'":
                       line = line.replace(letter, '')  
                   elif letter in string.punctuation: #get rid of punctuation
                       line = line.replace(letter, ' ')
               
               list_of_words = line.split() 
               for word in list_of_words:
                   #print(word)
                   print(self.concordance_table.hash_table)
                   if word.isalpha():
                       word = word.lower() #make uppercase into lowercase 
                       
                       if self.stop_table.in_table(word) == False: #if not a stop word
                           #print(word, 'not stop')
                          
                           if self.concordance_table.in_table(word) == True: #if word in table 
                               #print(self.concordance_table.get_value(word))
                               #print(word, self.concordance_table.get_value(word))
                               print(self.concordance_table.in_table('throw'))

                               list_of_line_numbers = self.concordance_table.get_value("throw") #get line number of word
                               #except:
                              # print(word, TypeError)
                               #print('word in', word)
                               
                               if line_number != list_of_line_numbers[-1]: #if not already there
                                   list_of_line_numbers.append(line_number) #add the new line number 
                                   # imprint(line_number)
                                   # print(list_of_line_numbers)
                           else:
                               self.concordance_table.insert(word, [line_number]) #otherwise add it

        except FileNotFoundError: #if file does not exist 
           raise FileNotFoundError('oops! this file does not exist') 
        

        
    def write_concordance(self, filename):
        
        f = open(filename, 'w') #open output file 
        keys = self.concordance_table.get_all_keys() #get al the keys, aka the words 
        keys.sort() #sort them alhpabetically 
        line_counter = 0 #starts at 0 lines
        my_list = [] #empty list 

        for i in keys: #for each word 
            if i != None: #if it is a word
                line_counter += 1 #add a line counter
                list_of_nums = self.concordance_table.get_value(i)
                #print(list_of_nums)
                line_representations = ''
                for b in list(list_of_nums):
                    line_representations += ' ' + str(b)
                my_list.append(i + ':' + line_representations + '\n') #add enter space
        my_list[-1] = my_list[-1].strip('\n') #remove enter spaces
        print(my_list)
        for i in my_list:
           f.write(i)




if __name__ == "__main__":
    c = Concordance()
    c.load_stop_table("stop_words.txt")
    c.load_concordance_table("file1.txt")
    c.write_concordance("ab.txt")
    
    