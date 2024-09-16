#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 24 23:26:37 2022

@author: mollysandler
"""

class Node:
    '''defines the node class'''
    def __init__(self, data):
        self.data = data 
        self.next = None 
        self.prev = None
        
    def __repr__(self):
        return str(self.data)
    
    def __eq__(self, other):
        return ((type(other) == Node)
         and self.data == other.data
         and self.next == other.next
         and self.prev == other.prev )
    
        
class Ordered:
    '''Defines the ordered list class'''
    def __init__(self):
        self.head = None # first node in list 
        self.tail = None # last node in list
        self.num_items = 0 # items in list
        
    def __eq__(self, other):
        return ((type(other) == Ordered)
          and self.head == other.head
          and self.tail == other.tail) 
          
    def __repr__(self):
        order = []
        top = self.head
        while top is not None:
            order.append(top.data)
            top = top.next
        return str(order)
        
    def orderedList(self) : #works #tested
        '''creates a new ordered list that is empty. It needs no parameters and returns an empty list'''
        order = list()
        return order
                
    def add(self, item): #works #kinda tested
        ''' adds a new item to the list making sure that the order is preserved. It needs the item and 
        returns nothing. Assume the item is not already in the list '''
        current = self.head
        prev = None
       
        while current != None :
            if current.data > item :
                break
            prev = current
            current = current.next
       
        if prev == None :
            new = Node(item)
            new.next = current
            new.prev = None
            self.head = new

            if (self.num_items == 0):
                self.tail = new
            else:
                current.prev = new
        elif current == None :
            new = Node(item)
            new.next = current
            new.prev = prev
            prev.next = new
            self.tail = new

        else:
            new = Node(item)
            new.next = current
            new.prev = prev
            current.prev = new
            prev.next = new
        self.num_items += 1
                
    def remove(self, item): #works #kinda tested
        '''removes the item from the list. It needs the item and modifies the list.  Assume the item is 
        present in the list'''
        
        if self.num_items > 1:
            current = self.head
            index = 0
            while current !=  None:
                if (current.data == item):
                    break
                current = current.next
                index +=1
        
            if index == 0 :
                self.head = current.next
                self.head.prev = None
        
            elif current.next == None :
                self.tail = current.prev
                self.tail.next = None
            else:
                current.prev.next = current.next
                current.next.prev = current.prev
            self.num_items -= 1
            return index
        if self.num_items == 1:
            self.num_items = 0
            return []
            
        
    def search_forward(self, item): #works #tested
        '''searches for the item in the list. It needs the item and returns the boolean value 
        True if the item is in the list and False if the item is not in the list'''
        current = self.head
        while current != None:
            if current.data == item:
                return True
            current = current.next
        return False
    
    def search_backward(self, item): #works #tested
        '''searches for the item in the list starting from the tail of the list.. It needs the 
         item and returns the boolean value True if the item is in the list and False if the item is not in the list.''' 
        current = self.tail
        while current != None:
            if current.data == item:
                return True
            current = current.prev
        return False
        
    def size(self): #works #tested
        '''returns the number of items in the list. It needs no parameters and returns an integer'''
        return self.num_items
            
    def is_empty(self): #works #testeed
        '''tests to see whether the list is empty. It needs no parameters and returns a boolean value.  
        True if the list is empty and False if any items are in the list'''
        if self.size() == 0:
            return True
        else: 
            return False
        
    def index(self, item): #works #tested 
        '''returns the position of item in the list. It needs the item and returns the index. Assume the 
        item is in the list'''
        count = 0
        current = self.head
        while current != None:
            if current.data == item:
                return count
            count += 1
            current = current.next
        

    def pop(self): #works
        '''removes and returns the last item in the list. It needs nothing and returns an item. Assume the list 
        has at least one item'''
        temp = self.tail
        self.tail = temp.prev
        self.tail.next = None
        self.num_items -= 1
        
        return temp
        
            
    def pop_pos(self, pos): #works #tested
        '''removes and returns the item at position pos. It needs the position and returns the item. 
        Assume the item is in the list.  pop(pos) should compare pos to the size of the list and search from 
        the head if pos <= size/2 and from the rear if pos > size/2'''
    
        count = 0
        current = self.head
        while current != None:
            if count == pos:
                return current.data
            count += 1
            current = current.next


#if __name__ == "__main__":

    
    
    
    
    
