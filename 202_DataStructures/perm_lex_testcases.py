#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 13 10:48:11 2022

@author: mollysandler
"""

import unittest
from assignment1 import *

class Test_Perms(unittest.TestCase):
    
    def test_for_empty_list(self):
        #tests for empty string
        string_used = ''
        self.assertEqual(perm_gen_lex(string_used),[])
    def test_for_single_char(self):
        #tests for single character string
        string_used = 'a'
        self.assertEqual(perm_gen_lex(string_used),['a'])
    def test_for_abc(self):
        #tests for three distinct lowercase letters in alphabetical order
        string_used = 'abc'
        self.assertEqual(perm_gen_lex(string_used),['abc', 'acb', 'bac', 'bca', 'cab', 'cba'])
    def test_for_not_alph(self):
        #tests for non-alphabetical order - assuming false
        string_used = 'bca'
        self.assertNotEqual(perm_gen_lex(string_used),['abc', 'acb', 'bac', 'bca', 'cab', 'cba'])

if __name__ == "__main__":
        unittest.main()