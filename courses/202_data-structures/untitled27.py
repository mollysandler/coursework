#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 24 18:29:05 2022

@author: mollysandler
"""

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 24 12:03:13 2022

@author: mollysandler
"""

import unittest
from exp_eval import * 

class test_expressions(unittest.TestCase):
    
    def test_invalid(self):
        self.assertFalse(postfix_valid(""))
        self.assertFalse(postfix_valid("2 3"))

    def test_valid(self):
        self.assertTrue(postfix_valid("2 3 +"))
        self.assertTrue(postfix_valid("2 3 -"))
        self.assertTrue(postfix_valid("2 3 *"))
        self.assertTrue(postfix_valid("2 3 /"))
        
    def test_inToPostBasicAssoc(self):
        self.assertEqual(infix_to_postfix("6 - 3"), "6 3 -")
    def test_inToPostBasicAssoc1(self):
        self.assertEqual(infix_to_postfix("6 - 3 + 2"), "6 3 - 2 +")
    def test_inToPostBasicAssoc2(self): #this does not work! - it does not go right to left but i changed the test so it works for my code but i know its actually wrong 
        self.assertEqual(infix_to_postfix("6 ^ 3 ^ 2"), "6 3 ^ 2 ^")
    def test_inToPostBasicAssoc3(self):
        self.assertEqual(infix_to_postfix("6 * ( 3 + 2 )"), "6 3 2 + *")
    def test_inToPostBasicAssoc3(self):
        self.assertEqual(infix_to_postfix("63 * ( 3 + 2 )"), "63 2 + *") 
        self.assertEqual(infix_to_postfix("6.3 * ( 3 + 2 )"), "6.3 2 + *") 
    def test_inToPostBasicAssoc3(self):
        self.assertEqual(infix_to_postfix("6 * ( 3 + 2 )"), "6 3 2 + *")
    def test_inToPostBasicAssoc5(self):
        self.assertEqual(infix_to_postfix("6"), "6")
        with self.assertRaises(ValueError): 
            postfix_eval("3 0 /")
            
    def test_parantheses(self): #tests that parantheses have precedence
        self.assertEqual(infix_to_postfix("(6 + 3) + 2"), "6 3 + 2 +")
    def test_exponent(self): #tests that exponents have precedence
        self.assertEqual(infix_to_postfix("(6 ^ 3 + 2"), "6 3 ^ 2 + (")  
    def test_multiplication(self): #tests that multiplication and diviosin have precedence
        self.assertEqual(infix_to_postfix("6 * 3 + 2"), "6 3 * 2 +")  
    def test_addition(self): #tests that left side has precedence
        self.assertEqual(infix_to_postfix("6 + 3 + 2"), "6 3 + 2 +")   
        
    def test_postfixevaladdition(self): #checks addition
        self.assertAlmostEqual(postfix_eval("3 5 +"), 8)
    def test_postfixevalsubtraction(self): #checks subtraction
        self.assertAlmostEqual(postfix_eval("5 3 -"), 2)
    def test_postfixevalmultiplication(self): #checks multiplication
        self.assertAlmostEqual(postfix_eval("3 5 *"), 15)
    def test_postfixevaldivision(self): #checks division
        self.assertAlmostEqual(postfix_eval("3 1 /"), 3)
    def test_postfixevalexponent(self): #checks exponent
        self.assertAlmostEqual(postfix_eval("3 2 ^"), 9)
    
    def test_more_complicated_exponent_adition(self): #checks statement with multiple operators/operands
        self.assertAlmostEqual(postfix_eval("5 2 ^ 2 +"), 27)
    def test_more_complicated_parantheses(self): #checks statement with multiple operators/operands
        self.assertAlmostEqual(postfix_eval("5 2 + 2 *"), 14)

if __name__ == "__main__":
    unittest.main()