#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Mar  4 15:57:49 2022

@author: mollysandler
"""

import unittest
from hash_quad import *


class TestList(unittest.TestCase):

   def test_size(self): #checks size works
       ht = HashTable(6)
       ht.insert("hi", 1)
       self.assertEqual(ht.get_table_size(), 6)

   def test_size_zero(self): #checks if size is 0
       ht = HashTable(0)
       with self.assertRaises(ZeroDivisionError):
            ht.insert('hi', 1)

   def test_lambda_above_half(self): #checks the size increases
       ht = HashTable(1)
       ht.insert('hi', 1)
       self.assertEqual(ht.get_table_size(), 3)

   def test_lamda_two(self): #checks size increases again
       ht = HashTable(2)
       ht.insert('hi', 1)
       ht.insert('hello', 2)
       self.assertEqual(ht.get_table_size(), 5)

   def test_random_1x(self): #checks the value replaces for same key
       ht = HashTable(2)
       ht.insert('hi', 5)
       ht.insert('hi', 4)
       self.assertEqual(ht.get_table_size(), 2)
       self.assertEqual(ht.get_value('hi'), 4)

   def test_num_items_one(self):
       ht = HashTable(7)
       ht.insert("cat", 5)
       self.assertEqual(ht.get_num_items(), 1)

   def test_num_items_many(self):
       ht = HashTable(1)
       ht.insert("ih", 2)
       ht.insert('hello', 3)
       ht.insert('rfgkj', 4)
       ht.insert('rgnw', 0)
       self.assertEqual(ht.get_num_items(), 4)

   def test_num_items_0(self):
       ht = HashTable(7)
       self.assertEqual(ht.get_num_items(), 0)

   def test_load_factor(self):
       ht = HashTable(1)
       ht.insert("hi", 2)
       ht.insert('hello', 3)
       ht.insert('aef', 4)
       ht.insert('gwe', 0)
       self.assertEqual(ht.get_table_size(), 15)
       self.assertAlmostEqual(ht.get_load_factor(), 4/15)

   def test_zero_load_factor(self):
       ht = HashTable(0)
       with self.assertRaises(ZeroDivisionError):
            ht.get_load_factor()

   def test_get_keys_simple(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       self.assertEqual(ht.get_all_keys(), ["hi"])

   def get_all_keys_none(self):
       ht = HashTable(7)
       self.assertEqual(ht.get_all_keys(), [])

   def get_all_keys_many(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       ht.insert('hello', 3)
       ht.insert('rgw', 4)
       ht.insert('rgww', 0)
       self.assertEqual(ht.get_all_keys(), ["hi", 'hello', 'rgw' ,'rgww'])

   def test_in_table(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       self.assertEqual(ht.in_table("hi"), True)
       self.assertEqual(ht.in_table('rgw'), False)

   def test_blank_space(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       self.assertEqual(ht.in_table(""), False)

   def test_get_value(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       self.assertEqual(ht.get_value("hi"), 1)

   def test_get_index(self):
       ht = HashTable(7)
       ht.insert("hi", 1)
       self.assertEqual(ht.get_index("hi"), 4)


if __name__ == '__main__':
  unittest.main()
