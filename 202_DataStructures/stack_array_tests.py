#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 16 14:19:29 2022

@author: mollysandler
"""

import unittest
from stack_array import Stack


class TestLab2(unittest.TestCase):
    def test_init(self): #tests init function given 
        stack = Stack(5)
        self.assertEqual(stack.items, [None]*5)
        self.assertEqual(stack.capacity, 5)
        stack = Stack(5, [1, 2])
        self.assertEqual(stack.items[0:2], [1, 2])
        self.assertEqual(stack.capacity, 5)
        with self.assertRaises(IndexError):
            Stack(5, [1, 2, 3, 4, 5, 6])
    def test_eq(self): #tests eq function given 
        stack1 = Stack(5)
        stack2 = Stack(5)
        stack3 = Stack(10)
        stack4 = Stack(5,[1, 2])
        self.assertEqual(stack1, stack2)
        self.assertNotEqual(stack1, stack3)
        self.assertNotEqual(stack1, stack4)
    def test_repr(self): #tests repr function given 
        stack = Stack(5, [1, 2])
        self.assertEqual(stack.__repr__(), "Stack(5, [1, 2])")
        
    #added tests
    def test_push_error(self): #checks if indexerror is raised with push function
        stack = Stack(3, [1, 2, 3])
        with self.assertRaises(IndexError):
            stack.push(5)
    def test_pop_error(self): #checks if index error is raised with pop function
        stack = Stack(3, [])
        with self.assertRaises(IndexError):
            stack.pop()
    def test_peek_error(self): #checks if indexerror is raised with peek function
        stack = Stack(3, [])
        with self.assertRaises(IndexError):
            stack.peek()
            
    def test_is_empty_true(self): #checks if true is returned when stack is empty
        stack = Stack(3, [])
        self.assertEqual(stack.is_empty(), True)
    def test_is_empty_false(self): #checks if false is returned when stack is not empty
        stack = Stack(3, [1, 2])
        self.assertEqual(stack.is_empty(), False)
        
    def test_is_full_true(self): #checks if true is returned when stack is full
        stack = Stack(3, [1, 2, 3])
        self.assertEqual(stack.is_full(), True)
    def test_is_full_false(self): #checks if false is returned when stack is not full
        stack = Stack(3, [1, 2])
        self.assertEqual(stack.is_full(), False)
        
    def test_push_if_empty(self): #checks number of items is incremented by one
        x = Stack(3, [])
        self.assertEqual(x.push(3), 1)
        print(x)
    def test_push_if_has_items(self): #checks number of items is incremented by one
        x = Stack(4, [1, 2, 3])
        self.assertEqual(x.push(3), 4)
        print(x)
    
    def test_pop_if_full(self): #returns popped vale which is last in the last
        x = Stack(4, [1, 2, 3, 4])
        self.assertEqual(x.pop(), 4)
        print(x)
    def test_pop_if_some_items(self): #returned popped value which is just in the list
        x = Stack(4, [1, 2, 3])
        self.assertEqual(x.pop(), 3)
        print(x)
        
    def test_peek_if_full(self): #returns last value whch is last in list
        x = Stack(4, [1, 2, 3, 4])
        self.assertEqual(x.peek(), 4)
        print(x)
    def test_peek_if_some_items(self): #returns last value which is just in list
        x = Stack(4, [1, 2, 3])
        self.assertEqual(x.peek(), 3)
        print(x)
    
    def test_size_if_full(self): #returns size if it is full
        x = Stack(4, [1, 2, 3, 4]) 
        self.assertEqual(x.size(), 4)
        print(x)
    def test_size_if_empty(self): #returns size if it is empty
        x = Stack(4, [])
        self.assertEqual(x.size(), 0)
        print(x)
    def test_size_if_some(self): #returns size if some are in it
        x = Stack(4, [1, 2, 3])
        self.assertEqual(x.size(), 3)
        print(x)
        
        
        
if __name__ == '__main__' : 
    unittest.main()
    
    


               
               
               
               
               