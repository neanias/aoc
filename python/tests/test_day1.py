from aoc import day1
import unittest

class TestDay1(unittest.TestCase):
    def test_part1(self):
        self.assertEqual(day1.reduce('1122'), 3)
        self.assertEqual(day1.reduce('1111'), 4)
        self.assertEqual(day1.reduce('1234'), 0)
        self.assertEqual(day1.reduce('91212129'), 9)
