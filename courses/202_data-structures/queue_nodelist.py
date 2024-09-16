    
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 20 09:36:18 2022

@author: mollysandler
"""

class Queue: 
    def __init__(self, capacity): 
     self.capacity = capacity   # the maximum number of items that can be stored in queue 
     self.array = [None] * capacity # array for queue
     self.front = 0
     self.rear = 0
     self.amount = 0 # the number of items stored in queue currently

 
    def is_empty(self): 
        '''defines if the queue is empty'''
        if self.amount == 0:
            return True
        else:
            return False
 
    def is_full(self): 
        '''defines if the queue is full'''
        if self.amount == self.capacity:
            return True
        else:
            return False
 
    def enqueue(self, item):
        '''adds an item to the back of the queue'''
        if self.is_full():
            raise IndexError
        else: 
            self.array[self.rear] = item
            self.rear = (self.rear + 1) % self.capacity
            self.amount += 1           
 
    def dequeue(self): 
        '''removes an item from the front of the queue'''
        if self.is_empty():
            raise IndexError
        else:
            temp = self.array[self.front]
            self.array[self.front] = None
            self.front = (self.front + 1) % self.capacity
            self.amount -= 1           
 
    def num_in_queue(self): 
        '''returns the number of items in the queue'''
        return self.amount



    
    
    
