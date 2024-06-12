#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 24 10:14:13 2022

@author: mollysandler
"""

from hash_quad import *
import string

class Concordance:
    def __init__(self):
        self.stop_table = None          # hash table for stop words
        self.concordance_table = None   # hash table for concordance
    
    def load_stop_table(self, filename):
        try:
           file = open(filename, 'r')
           self.stop_table = HashTable(191) 
           for line in file:
               self.stop_table.insert(line.strip('\n'), None)
           file.close()
        except FileNotFoundError:
           raise FileNotFoundError('oops! this file does not exist :(')
        
    def load_concordance_table(self, filename):
        """ Read words from input text file (filename) and insert them into the 
        concordance hash table,after processing for punctuation, numbers and 
        filtering out words that are in the stop words hash table.
        Do not include duplicate line numbers (word appearing on same line more 
        than once, just one entry for that line) Starting size of hash table should 
        be 191: self.concordance_table = HashTable(191)
        Process of adding new line numbers for a word (key) in the concordance:
        If word is in table, get current value (list of line numbers), append 
        new line number, insert (key, value)
        If word is not in table, insert (key, value), where value is a 
        Python List with the line number. If file does not exist, raise FileNotFoundError"""
        try:
           f = open(filename, 'r')
           self.concordance_table = HashTable(191)
           line_number = 0
           for line in f:
               line_number += 1
               for letter in line:
                   if letter == "'":
                       line = line.replace(letter, '')
                   elif letter in string.punctuation:
                       line = line.replace(letter, ' ')
               list_of_words = line.split()
               # print(list_of_words)
               for word in list_of_words:
                   # print(word)
                   # print(self.concordance_table)
                   if word.isalpha():
                       word = word.lower()
                       # print(self.concordance_table)
                       if self.stop_table.in_table(word) is False:
                           # print(word, 'is not a stop word')
                           if self.concordance_table.in_table(word):
                               list_of_line_numbers = self.concordance_table.get_value(word)
                               # print('word already in table', word)
                               # print('doubuvbeb iebeivbeivb', list_of_line_numbers)
                               if line_number != list_of_line_numbers[-1]:
                                   list_of_line_numbers.append(line_number)
                                   # print(line_number)
                                   # print(list_of_line_numbers)
                                   # self.concordance_table.insert(word, list_of_line_numbers)
                           else:
                               self.concordance_table.insert(word, [line_number])
        except FileNotFoundError:
           raise FileNotFoundError
    
    def write_concordance(self, filename):
        """ Write the concordance entries to the output file(filename)
        See sample output files for format."""
        f = open(filename, 'w')
        all_keys = self.concordance_table.get_all_keys()
        all_keys.sort()
        line_counter = 0
        my_list = []

        for i in all_keys:
           if i is not None:
               line_counter += 1
               list_of_nums = self.concordance_table.get_value(i)
               line_representations = ''
               for b in list_of_nums:
                   line_representations += ' ' + str(b)
               my_list.append(i + ':' + line_representations + '\n')
        my_list[-1] = my_list[-1].strip('\n')
        print(my_list)
        for i in my_list:
           f.write(i)

        
        
if __name__ == "__main__":
    hi = Concordance()
    print(hi.write_concordance('file1.txt'))
    
    
    
    