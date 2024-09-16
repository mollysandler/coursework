#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 17 14:56:09 2022

@author: mollysandler
"""

import unittest
from stack_nodelist import *
        
class TestLab2(unittest.TestCase):

    def test_node_init(self):
        node1 = Node(1, None)
        self.assertEqual(node1.value, 1)
        self.assertEqual(node1.rest, None)
        node2 = Node(2, node1)
        self.assertEqual(node2.value, 2)
        self.assertEqual(node2.rest, node1)
    def test_node_eq(self):
        node1a = Node(1, None)
        node1b = Node(1, None)
        node2a = Node(2, node1a)
        node2b = Node(2, node1b)
        self.assertEqual(node1a, node1b)
        self.assertNotEqual(node1a, node2a)
        self.assertEqual(node2a, node2b)
        node1a = Node(3, None)
        self.assertNotEqual(node1a, node1b)
    def test_node_repr(self):
        node = Node(2, Node(1, None))
        self.assertEqual(node.__repr__(), "Node(2, Node(1, None))")
    def test_stack_init(self):
        stack = Stack()
        self.assertEqual(stack.top, None)
        init_stack = Node(2, Node(1, None))
        stack = Stack(init_stack)
        self.assertEqual(stack.top, init_stack)
    def test_stack_eq(self):
        stack1 = Stack()
        stack2 = Stack()
        init_stack = Node(2, Node(1, None))
        stack4 = Stack(init_stack)
        self.assertEqual(stack1, stack2)
        self.assertNotEqual(stack1, stack4)
    def test_stack_repr(self):
        init_stack = Node(2, Node(1, None))
        stack = Stack(init_stack)
        self.assertEqual(stack.__repr__(), "Stack(Node(2, Node(1, None)))")

#added tests
    def test_stack_pop_empty(self): #raoses an error when popping from an empty stack
        stack = Stack()
        with self.assertRaises(IndexError):
            stack.pop()
    def test_stack_peek_empty(self): #raises an error when peeking an empty list
        stack = Stack()
        with self.assertRaises(IndexError):
            stack.peek()

    def test_stack_is_empty(self): #tests if the stack is empty when it is empty
        stack = Stack()
        self.assertEqual(stack.is_empty(), True)
    def test_stack_empty_false(self): #tests if stack is empty when it is not empty
        stack = Stack()
        stack.push(1)
        self.assertNotEqual(stack.is_empty(), True)

    def test_stack_push(self): #adds one value (node) into the stack
        stack = Stack()
        stack.push(1)
        self.assertEqual(stack, Stack(Node(1, None)))
    def test_stack_push_twice(self): #adds two values (nodes) into the stack 
        stack = Stack()
        stack.push(1)
        stack.push(2)
        self.assertEqual(stack, Stack(Node(2, Node(1, None))))
    def test_stack_push_opposite(self): #prints the two values in the opposite order of how they should be printed
        stack = Stack()
        stack.push(1)
        stack.push(2)
        self.assertNotEqual(stack, Stack(Node(1, Node(2, None))))
    
 
    def test_stack_pop_correct(self): #adds something to the list, then pops it out and returns the value
        stack = Stack()
        stack.push(1)
        self.assertEqual(stack.pop(), Node(1, None))
    def test_stack_pop_return_stack(self): #pops the second node added in a stack of two nodes
        stack = Stack()
        stack.push(1)
        stack.push(2)
        stack.pop()
        self.assertEqual(stack, Stack(Node(1, None)))
    
  
    def test_stack_peek_one(self): #peeks when there is one item in the stack 
        stack = Stack()
        stack.push(1)
        self.assertEqual(stack.peek(), Node(1, None))
    def test_stack_peek_multiple(self): #peeks the top when there is two items in the stack 
        stack = Stack()
        stack.push(1)
        stack.push(2)
        self.assertEqual(stack.peek(), Node(2, Node(1, None)))
 
    def test_size_empty(self): #returns zero when there is an empty list
        stack = Stack()
        self.assertEqual(stack.size(), 0)
    def test_size_multiple(self): #returns length of list when it is more than one
        stack = Stack()
        stack.push(1)
        stack.push(2)
        self.assertEqual(stack.size(), 2)

if __name__ == '__main__': 
    unittest.main()
    
    
