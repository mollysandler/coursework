#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan  7 15:18:08 2022

@author: mollysandler
"""
# CPE 202 Lab 1 Test Cases 
import unittest
from lab1 import *
 # A few test cases.  Add more!!! DONE
class TestLab1(unittest.TestCase):
    
    def test_max_list_iter_ValueError(self):
        '''checks if list is None a ValueError is raised'''
        tlist = None
        with self.assertRaises(ValueError):  # used to check for exception
            max_list_iter(tlist)
    def test_max_iter_empty_list(self):
        ''''checks if the list is empty and responds None'''
        tlist = []
        self.assertEqual(max_list_iter(tlist), None) 
    def test_max_iter_one_value(self):
        ''''checks if the list has one value in it'''
        tlist = [90]
        self.assertEqual(max_list_iter(tlist), 90) 
    def test_max_iter_first_value(self):
        ''''checks if the first value is the maximum'''
        tlist = [90, 80, 70, 60, 50]
        self.assertEqual(max_list_iter(tlist), 90)  
    def test_max_iter_last_value(self):
        ''''checks if the last value is the maximum'''
        tlist = [50, 60, 70, 80, 90]
        self.assertEqual(max_list_iter(tlist), 90) 
    def test_max_iter_all_negatives(self):
        ''''checks if numbers are all negative'''
        tlist = [-10, -60, -30, -4, -10]
        self.assertEqual(max_list_iter(tlist), -4) 
    def test_max_iter_mixed_signs(self):
        ''''checks if some numbers are negative and some positive'''
        tlist = [-10, 60, -30, 4, -10]
        self.assertEqual(max_list_iter(tlist), 60) 
    def test_max_iter_duplicates(self):
        ''''checks if there are duplicates'''
        tlist = [-10, 6, 12, 12, 10]
        self.assertEqual(max_list_iter(tlist), 12) 

        
    def test_reverse_rec(self):
        '''checks reversing a three item list'''
        self.assertEqual(reverse_rec([1,2,3]),[3,2,1])
    def test_reverse_rec_one_item(self):
        '''checks if list has one item in it'''
        self.assertEqual(reverse_rec([1]),[1])
    def test_reverse_rec_ValueError(self):
        '''checks if list is None a ValueError is raised'''
        tlist = None
        with self.assertRaises(ValueError):  # used to check for exception
            reverse_rec(tlist)
        
        
    def test_bin_search_target_is_midpoint(self):
        '''checks if target is midpoint'''
        list_val =[0, 1, 2, 3, 4, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(4, 0, len(list_val)-1, list_val), 4 )
    def test_bin_search_ValueError(self):
        '''checks if list is None a ValueError is raised'''
        tlist = None
        low = 0
        high = 100 #cannot find length of no list so make high a random value
        with self.assertRaises(ValueError):  # used to check for exception
            bin_search(1, 0, 100, tlist) 
    def test_bin_search_no_target_found(self):
        '''checks if target is not in list'''
        list_val =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(11, 0, len(list_val)-1, list_val), None)
    def test_bin_search_target_is_first_value(self):
        '''checks if target is the first value in the list'''
        list_val = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(0, 0, len(list_val)-1, list_val), 0)
    def test_bin_search_target_is_last_value(self):
        '''checks if target is the last value in the list '''
        list_val =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(10, 0, len(list_val)-1, list_val), 10 )
    def test_bin_search_target_is_less_than_midpoint(self):
        '''checks if target is less than midpoint'''
        list_val =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(1, 0, len(list_val)-1, list_val), 1 )
    def test_bin_search_target_is_more_than_midpoint(self):
        '''checks if target is more than midpoint'''
        list_val =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        low = 0
        high = len(list_val) -1
        self.assertEqual(bin_search(8, 0, len(list_val)-1, list_val), 8 )
    def test_bin_search_list_of_negatives(self):
        '''checks if values are negative'''
        list_val =[-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0]
        low = -10
        high = len(list_val) -1
        self.assertEqual(bin_search(-3, 0, len(list_val)-1, list_val), 7 )
    def test_bin_search_list_of_mixed_signs(self):
        '''checks if values are negative and positive'''
        list_val =[-10, -9, -1, 4, 6, 7, 8, 9, 10, 11, 12]
        low = -10
        high = len(list_val) -1
        self.assertEqual(bin_search(8, 0, len(list_val)-1, list_val), 6 )




if __name__ == "__main__":
        unittest.main()