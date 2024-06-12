#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 20 20:44:56 2022

@author: mollysandler
"""

import unittest
from heap import *

class Test(unittest.TestCase):
    def test_is_empty(self): #pass
        h1 = MaxHeap(5)
        h2 = MaxHeap(1)
        h2.enqueue(22)
        self.assertTrue(h1.is_empty())
        self.assertFalse(h2.is_empty())
    def test_is_full(self): #pass
        h1 = MaxHeap(5)
        h2 = MaxHeap(1)
        h2.enqueue(22)
        self.assertTrue(h2.is_full())
        self.assertFalse(h1.is_full())
    def test_enqueue(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(1)
        h1.enqueue(4)
        self.assertEqual(h1.contents(), [6, 1, 4])
    def test_enqueue_error(self): #pass
        h1 = MaxHeap(1)
        h1.enqueue(1)
        with self.assertRaises(IndexError):
            h1.enqueue(2)
    def test_peek(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(1)
        h1.enqueue(4)
        self.assertEqual(h1.peek(), 6)
    def test_peek_error(self): #pass
        h1 = MaxHeap(1)
        with self.assertRaises(IndexError):
            h1.peek()
    def test_dequeue(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(1)
        h1.enqueue(4)
        h1.dequeue()
        self.assertEqual(h1.contents(), [6, 1])
    def test_dequeue_error(self): #pass
        h1 = MaxHeap(1)
        with self.assertRaises(IndexError):
            h1.dequeue()
    def test_contents(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(1)
        h1.enqueue(4)
        self.assertEqual(h1.contents(), [6, 1, 4])
    def test_contents_empty(self): #pass
        h1 = MaxHeap(1)
        self.assertEqual(h1.contents(), [])
    def test_amount(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        self.assertEqual(h1.amount(), 4)
    def test_size(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(4)
        h1.dequeue()
        self.assertEqual(h1.size(), 1)
    def test_perc_up(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(4)
        h1.enqueue(8)
        self.assertEqual(h1.contents(), [8, 4, 6])
    def test_perc_down(self): #pass
        h1 = MaxHeap(5)
        h1.enqueue(6)
        h1.enqueue(4)
        h1.enqueue(8)
        h1.dequeue()
        self.assertEqual(h1.contents(), [8, 4])
    def test_build_heap(self): #pass
        h1 = MaxHeap(10)
        alist = [1, 8, 7, 4, 5, 13, 19]
        h1.build_heap(alist)
        self.assertEqual(h1.contents(), [19, 8, 13, 4, 5, 1, 7])
    def test_heap_sort_odd(self): #pass
        alist = [12, 11, 13, 14, 9, 10, 18]
        h1 = MaxHeap(len(alist))
        self.assertEqual(h1.heap_sort_ascending(alist), [9, 10, 11, 12, 13, 14, 18])
    def test_heap_sort_even(self): #pass
        alist = [12, 11, 13, 14, 9, 10]
        h1 = MaxHeap(len(alist))
        self.assertEqual(h1.heap_sort_ascending(alist), [9, 10, 11, 12, 13, 14])




if __name__ == "__main__":
    unittest.main()