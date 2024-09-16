#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan 25 09:52:15 2022

@author: mollysandler
"""

import unittest
from ordered_list import *

class testing(unittest.TestCase):
    def test_node_init(self): #tests node init
        node1 = Node(1)
        self.assertEqual(node1.data, 1)
    
    def test_list_init(self): #tests list init 
        order = Ordered()
        self.assertEqual(order.head, None)
        self.assertEqual(order.tail, None)
        self.assertEqual(order.num_items, 0)
        
    def test_index_one_value(self): #checks index of given value in list
        order = Ordered()
        order.add(1)
        self.assertEqual(order.index(1), 0)
        
    def test_index_many_values(self): #checks index of given value in a list of multiple nodes
        order = Ordered()
        order.add(1)
        order.add(2)
        order.add(3)
        self.assertEqual(order.index(3), 2)
        
    def test_search_forward_false_empty_list(self): #tests  earch forward returns false
        order = Ordered()
        self.assertEqual(order.search_forward(5), False)
    def test_search_forward_true_only_value(self): #tests search forward returns true
        order = Ordered()
        order.add(5)
        self.assertEqual(order.search_forward(5), True)
    def test_search_forward_multiples_middle_value(self): #tests search forward with multiple values returns true 
        order = Ordered()
        order.add(5)
        order.add(6)
        order.add(7)
        self.assertEqual(order.search_forward(6), True) #tets search forward with mutiple values returns true when last value
    def test_search_forward_last_value(self): #tests 
        order = Ordered()
        order.add(5)
        order.add(6)
        order.add(7)
        self.assertEqual(order.search_forward(7), True)
        
    def test_search_backward_false_empty_list(self): #tests above but for backwards
        order = Ordered()
        self.assertEqual(order.search_backward(5), False)
    def test_search_backward_true_only_value(self): ##tests above but for backwards 
        order = Ordered()
        order.add(5)
        self.assertEqual(order.search_backward(5), True)
    def test_search_backward_multiples_middle_value(self): ##tests above but for backwards 
        order = Ordered()
        order.add(5)
        order.add(6)
        order.add(7)
        self.assertEqual(order.search_backward(6), True)
    def test_search_backward_last_value(self): ##tests above but for backwards 
        order = Ordered()
        order.add(5)
        order.add(6)
        order.add(7)
        self.assertEqual(order.search_backward(7), True)
        
    def test_size_empty(self): #tests is size zero when list is empty
        order = Ordered()
        self.assertEqual(order.size(), 0)
    def test_size_one(self): #testsis size one with one item in list
        order = Ordered()
        order.add(5)
        self.assertEqual(order.size(), 1)
    def test_size_add_and_remove(self): #tests is correct size with adds and removes
        order = Ordered()
        order.add(5)
        order.add(6)
        order.remove(6)
        self.assertEqual(order.size(), 1)
        
    def test_list_is_empty(self): #tests if the list is empty when it is empty
        order = Ordered()
        self.assertEqual(order.is_empty(), True)
    def test_stack_empty_false(self): #tests if list is empty when it is not empty
        order = Ordered()
        order.add(1)
        self.assertNotEqual(order.is_empty(), True)
    
    def test_orderedlist(self): #tests if emoty string is returned with orderedlist function
        order = Ordered()
        self.assertEqual(order.orderedList(), [])
    
    def test_orderedlist_false(self): #tests if a none empty string returns false
        order = Ordered()
        self.assertNotEqual(order.orderedList(), [2])
        
    def test_pop_pos_one_value(self): #tests if the position of a value returns the value when given one item in list
        order = Ordered()
        order.add(4)
        self.assertEqual(order.pop_pos(0), 4)
        
    def test_pop_pos_middle_value(self): #tests if the position of a value returns the value when given many items in list
        order = Ordered()
        order.add(4)
        order.add(5)
        order.add(6)
        self.assertEqual(order.pop_pos(1), 5)
    def test_pop_pos_last_value(self): #tests if pop post works with last value in list 
        order = Ordered()
        order.add(4)
        order.add(5)
        order.add(6)
        self.assertEqual(order.pop_pos(2), 6)
        
    def test_list_remove_one_value_of_two(self): #adds one value (node) into the list
        order = Ordered()
        order.add(1)
        order.add(2)
        self.assertEqual(order.remove(2), 1)
        
    def test_remove_one_of_one(self):
        order = Ordered()
        order.add(1)
        self.assertEqual(order.remove(1), [])

#correct but some reason not being recognized as equal 
    def test_list_remove_one_middle_value(self): #removes one center value from the list
        order = Ordered()
        order.add(1)
        order.add(2)
        order.add(3)
        order.remove(2)
        self.assertEqual(order, [1, 3])
    
    def test_list_remove_one_value(self): #removes only value from list
        order = Ordered()
        order.add(1)
        order.remove(1)
        self.assertEqual(order, [])
    
    def test_stack_pop(self): #adds something to the list, then pops it out and returns the value
        order = Ordered()
        order.add(1)
        order.add(2)
        self.assertEqual(order.pop(), 2)
    
    def test_list_add(self): #adds one value (node) into the list
        order = Ordered()
        order.add(1)
        self.assertEqual(order, [1] )
        
    
    def test_list_double_add(self): #adds two values (nodes) into the stack 
        order = Ordered()
        order.add(1)
        order.add(2)
        self.assertEqual(order, [1, 2] )
        
    def test_stack_pop_return_list(self): #pops the second node added in a stack of two nodes
        order = Ordered()
        order.add(1)
        order.add(2)
        order.pop()
        self.assertEqual(order, [1])
    
    def test_ordered(self): #prints the two values in the opposite order of how they should be printed
        order = Ordered()
        order.add(1)
        order.add(2)
        self.assertEqual(order.add(3), [1, 2, 3])
        
    
if __name__ == '__main__': 
    unittest.main()