# Tests operations on binary numbers.
# CSC 225, Assignment 1
# Given tests, Spring '22

import unittest
import binary as bn

class TestBinary(unittest.TestCase):
    def test01_add(self): #testing add function #works 
        msg = "Testing basic binary addition"
        self.assertEqual(
         bn.add("0000000000000011", "0000000000000010"),
         "0000000000000101", msg)

    def test02_negate(self): #testing negate function #works 
        msg = "Testing basic binary negation"
        self.assertEqual(
         bn.negate("0000000000000001"),
         "1111111111111111", msg)

    def test03_subtract(self): #testing subtract function #works 
        msg = "Testing basic binary subtraction"
        self.assertEqual(
         bn.subtract("0000000000000011", "0000000000000010"),
         "0000000000000001", msg)

    def test04_multiply(self):
        msg = "Testing basic binary multiplication"
        self.assertEqual(
         bn.multiply("0000000000000100", "0000000000000101"),
         "0000000000010100", msg)

    def test05_binary_to_decimal(self):
        msg = "Testing basic binary-to-decimal conversion"
        self.assertEqual(
         bn.binary_to_decimal("0000000000000101"),
         5, msg)

    def test06_decimal_to_binary(self):
        msg = "Testing basic decimal-to-binary conversion"
        self.assertEqual(
         bn.decimal_to_binary(5),"0000000000000101", msg)


if __name__ == "__main__":
    unittest.main()