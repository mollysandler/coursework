#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 12:41:41 2022

@author: mollysandler
"""

import unittest
import subprocess
from concordance import *


class TestList(unittest.TestCase):

   def test_file1(self):
       conc = Concordance()
       conc.load_stop_table("stop_words.txt")
       conc.load_concordance_table("file1.txt")
       conc.write_concordance("file1_con.txt")
       err = subprocess.call("diff -wb file1_con.txt file1_sol.txt", shell=True)
       self.assertEqual(err, 0)
      
   def test_file2(self):
       conc = Concordance()
       conc.load_stop_table("stop_words.txt")
       conc.load_concordance_table("file2.txt")
       conc.write_concordance("file2_con.txt")
       err = subprocess.call("diff -wb file2_con.txt file2_sol.txt", shell=True)
       self.assertEqual(err, 0)
      
   def test_dec(self):
       conc = Concordance()
       conc.load_stop_table("stop_words.txt")
       conc.load_concordance_table("declaration.txt")
       conc.write_concordance("declaration_con.txt")
       err = subprocess.call("diff -wb declaration_con.txt declaration_sol.txt", shell=True)
       self.assertEqual(err, 0)
       


   def test_empty(self):
       conc = Concordance()
       conc.load_stop_table("stop_words.txt")
       conc.load_concordance_table("file_empty.txt")
       conc.write_concordance("file_empty_con.txt")
       err = subprocess.call("diff -wb file_empty_con.txt file_empty_sol.txt", shell=True)
       self.assertEqual(err, 0)

if __name__ == '__main__':
   unittest.main()

