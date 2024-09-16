#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan  9 15:20:53 2022

@author: mollysandler
"""

# CPE 202 Location Class Test Cases, Lab 1
import unittest
from lab1Location import *

class TestLocation(unittest.TestCase):
    def test_repr_true(self):
        '''given to us - testing that the repr function prints the locations with the desired' formatting'''
        loc = Location("SLO", 35.3, -120.7)
        self.assertEqual(repr(loc),"Location('SLO', 35.3, -120.7)")
    def test_repr_false(self):
        '''given to us - testing that the repr function does not work when not given the desired formatting'''
        loc = Location("SLO", 35.3, -120.7)
        self.assertNotEqual(repr(loc),"Location:'SLO', lat: 35.3, lon: -120.7)")
   
    
    def test_init_name(self):
       '''checks that the name part of the init function works'''
       loc = Location("SLO", 35.3, -120.7)
       self.assertEqual(loc.name == "SLO", True)
    def test_init_lat(self):
        '''checks that the latitude part of the init function works'''
        loc = Location("SLO", 35.3, -120.7)
        self.assertEqual(loc.lat == 35.3, True)
    def test_init_lon(self):
        '''checks that the longitude part of the init function works'''
        loc = Location("SLO", 35.3, -120.7)
        self.assertEqual(loc.lon == -120.7, True)
        
        
    def test_eq_true(self) :
        '''meant to return true, is a working set of two locations'''
        loc1 = Location("SLO", 35.3, -120.7)
        loc2 = Location("SLO", 35.3, -120.7)
        self.assertEqual((loc1 == loc2), True)
    def test_eq_false(self) :
        '''meant to return false, is two unequal locations'''
        loc1 = Location("SLO", 35.3, -120.7)
        loc2 = Location("Paris", 48.9, 2.4)
        self.assertNotEqual((loc1 == loc2), True)
    def test_eq_for_objects(self) :
        '''checks to test if one location is set equal to another initially'''
        loc1 = Location("SLO", 35.3, -120.7)
        loc2 = loc1
        self.assertEqual(loc1 == loc2, True)
    
  
    
  
    # Add more tests! DONE 
if __name__ == "__main__":
        unittest.main()
        
        
        
        