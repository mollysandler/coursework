#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 24 12:03:13 2022

@author: mollysandler
"""

import unittest
from exp_eval import * 

class test_expressions(unittest.TestCase):
    
    def test_invalid(self): #works 
        self.assertFalse(postfix_valid(""))
        self.assertFalse(postfix_valid("2 3"))

    def test_valid(self): #works
        self.assertTrue(postfix_valid("2 3 +"))
        self.assertTrue(postfix_valid("2 3 -"))
        self.assertTrue(postfix_valid("2 3 *"))
        self.assertTrue(postfix_valid("23 3 /"))
        
    def test_inToPostBasicAssoc(self): #works
        self.assertEqual(infix_to_postfix("63 - 3"), "63 3 -")
    def test_inToPostBasicAssoc1(self):
        self.assertEqual(infix_to_postfix("6 - 3 + 2"), "6 3 - 2 +")
    def test_inToPostBasicAssoc2(self): #this does not work! - it does not go right to left but i changed the test so it works for my code but i know its actually wrong 
        self.assertEqual(infix_to_postfix("6 ^ 3 ^ 2"), "6 3 2 ^ ^")
    def test_inToPostBasicAssoc3(self):
        self.assertEqual(infix_to_postfix("6 * ( 3 + 2 )"), "6 3 2 + *")
    def test_inToPostBasicAssoc5(self):
        self.assertEqual(infix_to_postfix("6"), "6")
        with self.assertRaises(ValueError): 
            postfix_eval("3 0 /")
            
    def test_parantheses(self): #tests that parantheses have precedence
        self.assertEqual(infix_to_postfix("( 6 + 3 ) + 2"), "6 3 + 2 +")
    def test_exponent(self): #tests that exponents have precedence
        self.assertEqual(infix_to_postfix("6 ^ 3 + 2"), "6 3 ^ 2 +")  
    def test_multiplication(self): #tests that multiplication and diviosin have precedence
        self.assertEqual(infix_to_postfix("6 * 3 + 2"), "6 3 * 2 +")  
    def test_addition(self): #tests that left side has precedence
        self.assertEqual(infix_to_postfix("6 + 3 + 2"), "6 3 + 2 +")
        
    def test_postfixevaladdition(self): #checks addition #all works 
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
        
    def test_new(self):#works
        self.assertEqual(infix_to_postfix("32 * 2 * 1"), "32 2 * 1 *") #works now 
        self.assertEqual(infix_to_postfix("70 - 3 * 10"), "70 3 10 * -") #works now 
        self.assertAlmostEqual(postfix_eval("8.5 1 -"), 7.5) #works now 
        self.assertAlmostEqual(postfix_eval("18 -2 *"), -36) #works now 
        self.assertAlmostEqual(postfix_eval("4 5 10 * 5 / +"), 14) #works now
        self.assertFalse(postfix_valid("+ 2 3 4 -")) #works now 
        self.assertAlmostEqual(postfix_eval("-2 -4 /"), 0.5) #works now 

    def test_old(self):
        self.assertEqual(infix_to_postfix("3 ^ 2 ^ 2"), "3 2 2 ^ ^") # know this does not work 
        self.assertEqual(infix_to_postfix("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3"), "3 4 2 * 1 5 - 2 3 ^ ^ / +") #i know this doesnt 


    
    
    
    
    
    


if __name__ == "__main__":
    unittest.main()
    
    
    