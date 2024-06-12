#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov  4 15:51:44 2021

@author: mollysandler
"""

import unittest

from work import exponent

class testExponent(unittest.TestCase):
    
    def test_exponent_single_digit(self):
       num = 6
       self.assertAlmostEqual(exponent(6), 403.43 , 2,  "something went wrong")
       
    def test_exponent_zeros(self):
       num = 0
       self.assertAlmostEqual(exponent(0), 1, "something went wrong")
       
    def test_exponent_negatives(self):
       num = -9
       self.assertAlmostEqual(exponent(-9), 0.00 , 2, "something went wrong")
       

if __name__ == "__main__":
    unittest.main()  
    
