import unittest

from aoc import day2


class TestDay2(unittest.TestCase):
    def test_part1(self):
        self.assertEqual(day2.part_1(('abcdef\nbababc\nabbcde\nabcccd\n'
                                      'aabcdd\nabcdee\nababab\n')), 12)
