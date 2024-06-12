#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 16 21:39:52 2022

@author: mollysandler
"""

class Node:
    def __init__(self, value, rest):
        self.value = value      # object reference stored in Node
        self.rest = rest        # reference to NodeList
    def __eq__(self, other):
        return ((type(other) == Node)
          and self.value == other.value
          and self.rest == other.rest
        )
    def __repr__(self):
        return ("Node({!r}, {!r})".format(self.value, self.rest))

class Stack:
    """Implements an efficient last-in first-out Abstract Data Type using a node list"""
    # top is the top Node of stack
    def __init__(self, top=None):
        self.top = top              # top node of stack
        self.num_items = 0          # number of items in stack
        node = top                  # set number of items based on input
        while node is not None:
            self.num_items += 1
            node = node.rest

    def __eq__(self, other):
        return ((type(other) == Stack)
          and self.top == other.top
        )

    def __repr__(self):
        return ("Stack({!r})".format(self.top))

    def is_empty(self):
        if self.num_items == 0:
            return True
        else:
            return False
        '''Returns True if the stack is empty, and False otherwise
           MUST have O(1) performance'''
        

    def push(self, item):
        temp = Node(item, None)
        temp.rest = self.top
        self.top = temp
        self.num_items += 1
        '''Pushes item on stack.
           MUST have O(1) performance'''
      

    def pop(self):
         if self.is_empty():
            raise IndexError
         else:
            temp = self.top
            self.top = temp.rest
            return temp
         '''If stack is not empty, pops item from stack and returns item.
           If stack is empty when pop is attempted, raises IndexError
           MUST have O(1) performance'''
       

    def peek(self):
         if self.is_empty():
            raise IndexError
         else:
             return self.top
         '''If stack is not empty, returns next item to be popped (but does not remove the item)
           If stack is empty, raises IndexError
           MUST have O(1) performance'''
       

    def size(self):
        return self.num_items
        '''Returns the number of elements currently in the stack, not the capacity
           MUST have O(1) performance'''
    
    
    