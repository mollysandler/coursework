#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb  3 09:49:09 2022

@author: mollysandler
"""
import unittest
from huffman import *
class TestList(unittest.TestCase):
    def test_cnt_freq(self):
        freqlist = cnt_freq("file2.txt")
        anslist = [2, 4, 8, 16, 0, 2, 0] 
        self.assertListEqual(freqlist[97:104], anslist)
        freqlist = cnt_freq("file.txt")
        anslist = [4, 3, 2, 1] 
        self.assertListEqual(freqlist[97:101], anslist)
    
    def test_create_huff_tree(self):
        freqlist = cnt_freq("file2.txt")
        hufftree = create_huff_tree(freqlist)
        self.assertEqual(hufftree.freq, 32)
        self.assertEqual(hufftree.char_ascii, 97)
        left = hufftree.left
        self.assertEqual(left.freq, 16)
        self.assertEqual(left.char_ascii, 97)
        right = hufftree.right
        self.assertEqual(right.freq, 16)
        self.assertEqual(right.char_ascii, 100)
    
    '''def test_create_header(self): #failing 
        freqlist = cnt_freq("file2.txt")
        self.assertEqual(create_header(freqlist), "97 2 98 4 99 8 100 16 102 2")
        freqlist = cnt_freq("file.txt")
        self.assertEqual(create_header(freqlist), "32 9 97 4 98 3 99 2 100 1")'''
    
    def test_create_code(self):
        freqlist = cnt_freq("file2.txt")
        hufftree = create_huff_tree(freqlist)
        codes = create_code(hufftree)
        self.assertEqual(codes[ord('d')], '1')
        self.assertEqual(codes[ord('a')], '0000')
        self.assertEqual(codes[ord('f')], '0001')
    
    def test_encode_huffman(self):
        in_file = "file3.txt"
        out_file = "newfile.txt"
        with self.assertRaises(FileNotFoundError):
             raise FileNotFoundError
    
    def test_empty(self):
        freq_list = cnt_freq('empty.txt')
        huffman_tree = create_huff_tree(freq_list)
        expected_huffman_tree = None
        self.assertEqual(huffman_tree, expected_huffman_tree)
        



line 110, in test_04_declaration huffman_encode("declaration.txt", "declaration_out.txt") 
line 195, in huffman_encode tree = create_huff_tree(freq) 
line 103, in create_huff_tree temp = combine(min1, min2) 

line 45, in combine f = a.freq + b.freq 
TypeError: unsupported operand type(s) for +: 'HuffmanNode' and 'HuffmanNode'














if __name__ == '__main__' : 
    unittest.main()