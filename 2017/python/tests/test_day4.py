import unittest

from aoc import day4

class TestDay4(unittest.TestCase):

    """Test case docstring."""

    def test_part_1_validator(self):
        self.assertEqual(day4.part_1_validator('aa bb cc dd ee'), True)
        self.assertEqual(day4.part_1_validator('aa bb cc dd aa'), False)
        self.assertEqual(day4.part_1_validator('aa bb cc dd aaa'), True)

    def test_part_2_validator(self):
        self.assertEqual(day4.part_2_validator('abcde fghij'), True)
        self.assertEqual(day4.part_2_validator('abcde fghij edcba'), False)
        self.assertEqual(day4.part_2_validator('a ab abc abd abf abj'), True)
        self.assertEqual(day4.part_2_validator('iiii oiii ooii oooi oooo'),
                         True)
        self.assertEqual(day4.part_2_validator('oiii ioii iioi iiio'), False)
