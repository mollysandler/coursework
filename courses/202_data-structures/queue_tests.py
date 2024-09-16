#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 17 21:03:19 2022

@author: mollysandler
"""
import unittest
from queue_nodelist import *
        
class TestLab2(unittest.TestCase):

    def test_init(self):
        num1 = Queue(3)
        self.assertEqual(num1.capacity, 3)
        self.assertEqual(num1.front, 0)
        self.assertEqual(num1.rear, 0)
        self.assertEqual(num1.amount, 0)
        
    def test_amount(self):
        q = Queue(2)
        q.enqueue(1)
        self.assertEqual(q.num_in_queue(),1)
    

    def test_enqueue_error(self): #raises an error when adding to a full queue
        queue = Queue(1)
        queue.enqueue(1)
        with self.assertRaises(IndexError):
            queue.enqueue(2)
    def test_dequeue_empty(self): #raises an error when removing from an empty queue
        queue = Queue(1)
        with self.assertRaises(IndexError):
            queue.dequeue()

    def test_queue_empty_true(self): #tests if the queue is empty when it is empty
        queue = Queue(0)
        self.assertEqual(queue.is_empty(), True)
    def test_queue_empty_false(self): #tests if stack is queue when it is not empty
        queue = Queue(1)
        queue.enqueue(1)
        self.assertNotEqual(queue.is_empty(), True)
        
        
    def test_queue_full_true(self): #tests if the queue is full when it is empty
        queue = Queue(1)
        queue.enqueue(1)
        self.assertEqual(queue.is_full(), True)
    def test_queue_full_false(self): #tests if queue is full when it is not empty
        queue = Queue(2)
        self.assertNotEqual(queue.is_full(), True)


    def test_enqueue(self): #adds one value into the queue
        queue = Queue(3)
        queue.enqueue(1)
        self.assertEqual(queue.array, [1, None, None])
        
    def test_enqueue_two_values(self): #adds one value into the queue
        queue = Queue(3)
        queue.enqueue(1)
        queue.enqueue(2)
        self.assertEqual(queue.array, [1, 2, None])


    def test_dequeue(self): #adds something, then removes it and prints the list
        queue = Queue(2)
        queue.enqueue(1)
        queue.dequeue()
        self.assertEqual(queue.array, [None, None])
        
    def test_dequeue_many_values(self): #adds things to the list and then removes and checks the full ist
        queue = Queue(4)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.dequeue()
        self.assertEqual(queue.array, [None, 2, 3, None])
        
        
        
        
    def test_dequeue_loop(self): #adds things to the list and then checks that it loops around properly
        queue = Queue(3)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.dequeue()
        queue.enqueue(4)
        self.assertEqual(queue.array, [4, 2, 3])

 
    def test_size_empty(self): #returns zero when there is an empty queue
        queue = Queue(1)
        self.assertEqual(queue.num_in_queue(), 0)
    def test_size_multiple(self): #returns length of queue when it is more than one but not full
        queue = Queue(3)
        queue.enqueue(1)
        queue.enqueue(2)
        self.assertEqual(queue.num_in_queue(), 2)
    def test_size_full(self): #returns length of queue when it is more than full
        queue = Queue(2)
        queue.enqueue(1)
        queue.enqueue(2)
        self.assertEqual(queue.num_in_queue(), 2)
    def test_dequeue_loop_size(self): #adds things to the list and then checks that it reads the size properly
        queue = Queue(3)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.dequeue()
        queue.enqueue(4)
        self.assertEqual(queue.num_in_queue(), 3)
    
        
if __name__ == '__main__': 
    unittest.main()