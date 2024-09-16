#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 23 12:53:45 2022

@author: mollysandler
"""

class HashTable:
    def __init__(self, table_size):         # can add additional attributes
        self.table_size = table_size        # initial table size
        self.hash_table = [None]*table_size # hash table
        self.num_items = 0                  # empty hash table
            
    def insert(self, key, value): #works
       """Inserts an entry into the hash table (using Horner hash function to determine index,
       and quadratic probing to resolve collisions).
       The key is a string (a word) to be entered, and value is any object (e.g. Python List).
       If the key is not already in the table, the key is inserted along with the associated value
       If the key is is in the table, the new value replaces the existing value.
       If load factor is greater than 0.5 after an insertion, hash table size should be increased
       to the next prime greater than 2*table_size."""
       try: 
           hash_val = self.horner_hash(key) % self.table_size #getting index
       except ZeroDivisionError:
              raise ZeroDivisionError('cannot make the size zero!')
       
       if self.hash_table[hash_val] == None: #if empty
           self.hash_table[hash_val] = (key, value) #insert value
           self.num_items += 1 #increment num items
       
       elif self.hash_table[hash_val][0] == key: #if the key already exists
           self.hash_table[hash_val] = (key, value) #replace the old value with current value
      
       else:
           start = 1 #starter val
           while start < self.table_size: #while less than table size
               
               step = start * start #square it
               j = (hash_val + step) % (self.table_size - 1) 
               
               if self.hash_table[j - 1] == None: #if none
                   self.hash_table[j - 1] = (key, value) #insert value
                   self.num_items += 1 #increment num items
                   
                   break #end loop
               start += 1 #increment starter val
       
       if self.get_load_factor() > .5: #fixing table size based on load factor
           self.num_items = 0 #reset num items
           self.table_size = self.table_size * 2 + 1 #change table size
           
           copy = self.hash_table.copy() #copy current hash
           self.hash_table = [None] * self.table_size #make new hash table with new size
           
           for item in copy: #for item in old hash
               if item != None: #if not none
                   self.insert(item[0], item[1]) #readd into new hash

                  
    def horner_hash(self, key): #works #as about 8 length
        """ Compute and return an integer from 0 to the (size of the hash table) - 1
        Compute the hash value by using Horner’s rule, as described in project 
        specification."""  
        val = 0 #set original index
        for i in range(len(key)): #length of given key
            val += ord(key[i]) * 31 ** (len(key) - 1 - i) #equation
        return val #return equation

    def in_table(self, key): #works
        """ Returns True if key is in an entry of the hash table, False otherwise. 
        Must be O(1)."""
        try: 
           hash_val = self.horner_hash(key) % self.table_size #getting index
       
        except ZeroDivisionError: #if size is 0 
              raise ZeroDivisionError('cannot make the size zero!')
        
        if self.hash_table[hash_val] == None: #if nothing in originial slot
           return False
        
        elif self.hash_table[hash_val][0] == key: #if key in originial slot
           return True
        
        else: #do quadratic probing to find it 
           num = 1
           while num < self.table_size:
               step = num * num
               j = hash_val + step
               j = j % (self.table_size - 1)
               
               if self.hash_table[j - 1] == None: #if hits a none, nothing is there
                   return False
               
               elif self.hash_table[j - 1][0] == key: #if key in slot 
                   return True
               num += 1
           
    def get_index(self, key): #works kinda
        """ Returns the index of the hash table entry containing the provided key. 
        If there is not an entry with the provided key, returns None. Must be 
        O(1)."""
        try: 
           hash_val = self.horner_hash(key) % self.table_size #getting index
          
           if self.in_table(key): #if in table 
                if self.hash_table[hash_val] == None: #if slot is none return none
                    return None
                
                elif self.hash_table[hash_val][0] == key: #if slot is the correct key
                   return hash_val #return original index
           
                else: #if key not in original but something else is 
                   num = 1 #quadratic probing
                   while num < self.table_size:
                       step = num * num
                       #print(step)
                       j = hash_val + step
                       j = j % (self.table_size)

                       if self.hash_table[j] and self.hash_table[j][0] == key: 
                           return j #return quadraticly probed index
                       num += 1
        
        except ZeroDivisionError:
              raise ZeroDivisionError('cannot make the size zero!')     
    
    def get_all_keys(self): #works
        """ Returns a Python list of all keys in the hash table."""
        keys = []
        for item in self.hash_table: #each item 
            if item != None:
                keys.append(item[0]) #add key to the list 
        return keys
    
    def get_value(self, key): #works 
        """ Returns the value (for concordance, list of line numbers) associated 
        with the key. If key is not in hash table, returns None. Must be O(1)."""
        if self.in_table(key) : #if not in table
           
            i = self.get_index(key) #get index
            return self.hash_table[i][1] #return the index + 1        
        
        else: #if not in table 
          return None
   
    def get_num_items(self): #works
        """ Returns the number of entries (words) in the table. Must be O(1)."""
        return self.num_items #return num items 
    
    def get_table_size(self): #works
        """ Returns the size of the hash table."""
        return self.table_size #return table size 
    
    def get_load_factor(self): #works
        """ Returns the load factor of the hash table (entries / table_size)."""
        try: 
            return self.num_items / self.table_size #return load size 
        except ZeroDivisionError: #if size is 0
              raise ZeroDivisionError('cannot make the size zero!')
        
        
if __name__ == "__main__":
    hi = HashTable(5)
    hi.insert('cat','wrge') 
    hi.insert('act', 'efq')
    hi.insert('tr', '4')
    hi.insert('unless', 'r')
    print(hi.hash_table)
    print(hi.get_value('unless'))
 
    
    
    
    
    
        