import unittest
from lab0 import *
class Test_planets(unittest.TestCase):
    def test_for_mars(self):
        weight = 136
        self.assertAlmostEqual(weight_on_planets(weight,"Mars"),51.68)
    def test_for_jupiter(self):
        weight = 136
        self.assertAlmostEqual(weight_on_planets(weight, "Jupiter"), 318.24)
    def test_for_error(self):
        with self.assertRaises(ValueError):  
            weight_on_planets(136, "Mercury")
if __name__ == "__main__":
        unittest.main()