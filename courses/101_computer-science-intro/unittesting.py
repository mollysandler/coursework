#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 30 16:33:08 2021

@author: mollysandler
"""

import unittest
from lab9 import calculate_average_heart_rates

class TestAvgerages(unittest.TestCase):
    
    def testAverageZeros(self):
       heart_rate = [[0, 0, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0]]
       self.assertEqual(calculate_average_heart_rates(heart_rate), [0,0,0,0] , "something went wrong :(")
       
       
    def testAverageLengthChanges(self):
        heart_rate = [[10, 10, 10, 10],[5, 5, 5, 5, 5],[8, 8, 8, 8, 8, 8], [0, 0, 0, 0, 0, 0, 0]]
        self.assertEqual(calculate_average_heart_rates(heart_rate), [10, 5, 8, 0], "something went wrong :(")
    
    def testAverageOneList(self):
        heart_rate = [[10, 90, 5, 3]]
        self.assertEqual(calculate_average_heart_rates(heart_rate),[27], "something went wrong :(")

if __name__ == "__main__":
    unittest.main()