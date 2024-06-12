#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar  6 14:10:30 2022

@author: mollysandler
"""

class HashTable:
    def __init__(self, table_size):             # can add additional attributes
        self.table_size = table_size            # initial table size
        self.hash_table = [None] * table_size   # hash table
        self.num_items = 0                      # empty hash table

    def insert(self, key, value):
        """ Inserts an entry into the hash table (using Horner hash function to determine index, 
        and quadratic probing to resolve collisions).
        The key is a string (a word) to be entered, and value is any object (e.g. Python List).
        If the key is not already in the table, the key is inserted along with the associated value
        If the key is in the table, the new value replaces the existing value.
        When used with the concordance, value is a Python List of line numbers.
        If load factor is greater than 0.5 after an insertion, hash table size should be increased (doubled + 1)."""

        val = self.horner_hash(key)
        if self.hash_table[val] == None:
            self.hash_table[val] = (key, value)
        else:
            j = 1
            while self.hash_table[val] != None:
                if key == self.hash_table[val][0]:
                    self.hash_table[val][1].append(value)
                    break
                val += j**2
                j += 1

        if self.get_load_factor() > 0.5:
            old = self.table_size
            self.table_size = (self.table_size * 2) + 1
            self.hash_table.append([None] * ((self.table_size * 2) + 1 - old))

    def horner_hash(self, key):
        """ Compute and return an integer from 0 to the (size of the hash table) - 1
        Compute the hash value by using Horner’s rule, as described in project specification."""
        length = len(key)
        if length > 8:
            length = 8
        h_val = 0
        for i in range(length):
            h_val += ord(key[i]) * 31**(length - 1 - i)
        return h_val % (self.table_size - 1)

    def in_table(self, key):
        """ Returns True if key is in an entry of the hash table, False otherwise. Must be O(1)."""
        index = self.horner_hash(key)

        if self.hash_table[index] == None:
            return False
        if self.hash_table[index][0] == key:
            return True
        else:
            try:
                i = 1
                while self.hash_table[index] != None and not self.hash_table[index][0] == key:
                    index += i ** 2
                    i += 1
                if self.hash_table[index] != None and self.hash_table[index][0] == key:
                    return True
                else:
                    return False
            except IndexError:
                return False

    def get_index(self, key):
        """ Returns the index of the hash table entry containing the provided key. 
        If there is not an entry with the provided key, returns None. Must be O(1)."""
        if self.in_table(key):
            index = self.horner_hash(key)
            if self.hash_table[index][0] == key:
                return index
            i = 1
            while self.hash_table[index] != None and not self.hash_table[index][0] == key:
                index += i ** 2
                i += 1
            return index
        else:
            return None

    def get_all_keys(self):
        """ Returns a Python list of all keys in the hash table."""
        key_list = []
        for i in self.hash_table:
            if i != None:
                key_list.append(i[0])
        return key_list

    def get_value(self, key):
        """ Returns the value (for concordance, list of line numbers) associated with the key.
        If key is not in hash table, returns None. Must be O(1)."""
        if self.in_table(key) == True:
            index = self.get_index(key)
            return self.hash_table[index][1]
        else:
            return None

    def get_num_items(self):
        """ Returns the number of entries (words) in the table. Must be O(1)."""
        return self.num_items

    def get_table_size(self):
        """ Returns the size of the hash table."""
        return self.table_size

    def get_load_factor(self):
        """ Returns the load factor of the hash table (entries / table_size)."""
        return self.num_items / self.table_size
    
    
if __name__ == "__main__":
    c = HashTable(5)
    c.insert('cat', 5)
    c.insert('ji', 5)
    print(c.hash_table)
    
    
    