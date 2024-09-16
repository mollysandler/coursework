#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 17 09:59:59 2022

@author: mollysandler
"""
class MaxHeap: #define class
    def __init__(self, capacity = 50): #done
        """Constructor creating an empty heap with default capacity = 50 but allows heaps of other capacities to be created."""
        self.capacity = capacity
        self.heap = [None]*(capacity + 1)  # index 0 not used for heap
        self.num_items = 0                       # empty heap
        self.index = self.num_items + 1
    
    def enqueue(self, item): #add item to heap #tested
        """inserts "item" into the heap
        Raises IndexError if there is no room in the heap"""
        if self.is_full(): #if full
            raise IndexError('the heap is already full!') #raise index error
        else: #if not full
            self.heap[self.index] = item #add item to end of list 
            self.perc_up(self.num_items -1)     #perc up through list to fix heap rules
            self.num_items += 1         #increment items 
            self.index += 1
    
    def peek(self): #peak  #tested
        """returns root of heap (highest priority) without changing the heap
        Raises IndexError if the heap is empty"""
        if self.is_empty(): #if empty 
            raise IndexError('the heap has no items') #raise index error
        else: #if not empty 
            return self.heap[1] #return root item 
    
    def dequeue(self): #remove root item #tested
        """returns item at root (highest priority) - removes it from the heap and restores the heap property
        Raises IndexError if the heap is empty"""
        if self.is_empty(): #if empty 
            raise IndexError('the heap is already empty!') #raise index error 
        elif self.num_items == 1: #if length one 
            self.num_items -= 1
            return self.heap[1] #return the one item '
        else: #if multiples items 
            temp = self.heap.pop() #temp is removal of root
            self.perc_down(self.num_items) #perc down to fix heap properties
            self.num_items -= 1 #decrement items 
            return temp #return temp
    
    def contents(self): #return as an array #tested
        """returns a list of contents of the heap in the order it is stored internal to the heap.
        (This may be useful for in testing your implementation.)
        If heap is empty, returns empty list []"""
        content = [] #defines empty list 
        if self.is_empty(): #if empty
            return content #return empty list 
        else: #if not empty 
            return self.heap[1:self.num_items + 1] #return as an array   
    
    def is_empty(self): #tested
        """returns True if the heap is empty, false otherwise"""
        if self.num_items == 0: #if amount of items is 0
            return True
        else:
            return False
    
    def is_full(self): #tested
        """returns True if the heap is full, false otherwise"""
        if self.num_items == self.capacity: #if amount of items is the capacity
            return True
        else:
            return False
    
    def amount(self): #changed name to amount because could not have capacity twice #tested
        """This is the maximum number of a entries the heap can hold, which is
        1 less than the number of entries that the array allocated to hold the heap can hold"""
        return self.capacity - 1
    
    def size(self): #tested
        """the actual number of elements in the heap, not the capacity"""
        return self.num_items #returns number of items 

    def perc_down(self, i):
        while (i * 2) <= self.num_items: #if in list
                maxi = self.find_max(i) #get max
                if self.heap[i] < self.heap[maxi]: #if max is larger than i 
                    self.heap[maxi], self.heap[i],  = self.heap[i], self.heap[maxi] #swap
                i = maxi #i equals max

    def find_max(self, i): 
        if self.num_items < (2 * i + 1):  
                return i*2
        else:
            if self.heap[2*i] <= self.heap[2*i +1]:
                return 2 * i +1                                            
            else:
                return (2 * i)                                     

    def perc_up(self, i): #tested
        """where the parameter i is an index in the heap and perc_up moves the element stored
        at that location to its proper place in the heap rearranging elements as it goes."""
        i = self.index
        while i // 2 > 0: #while parent
            if self.heap[i] > self.heap [i // 2]: #if child larger than parent
                tmp = self.heap[i // 2] #set temp
                self.heap[i // 2] = self.heap[i] #swap
                self.heap[i] = tmp #swap
            i = i // 2      #parent    
    
    def heap_sort_ascending(self, alist): #does one switch then stops 
        """perform heap sort on input alist in ascending order
        This method will discard the current contents of the heap, build a new heap using
        the items in alist, and mutate alist to put the items in ascending order"""
        self.build_heap(alist) #build heap
        while self.num_items > 0: #while heap
            self.perc_down(1) #perc down 
            self.heap[1], self.heap[self.num_items] = self.heap[self.num_items], self.heap[1] #swap
            self.num_items -= 1 #decrement
        return self.heap[1:] #remove the none
            
    def build_heap(self, alist): #tested
        """Discards the items in the current heap and builds a heap from
        the items in alist using the bottom up method.
        If the capacity of the current heap is less than the number of
        items in alist, the capacity of the heap will be increased to accommodate the items in alist"""
        i = len(alist) // 2 
        self.num_items = len(alist)
        self.heap = [self.heap[0]] + alist[:] #append
        
        while i > 0 :
            self.perc_down(i) #call perc down
            i = i - 1 #subtract one
    
if __name__ == "__main__":
    hi = MaxHeap(10)
    ar = [12, 11, 13, 14, 9, 10, 11]
    hi.build_heap(ar)
    print(hi.heap_sort_ascending(ar))
          
          
          
          
          
          
          
          