import unittest

from aoc import day1


class TestDay1(unittest.TestCase):
    def test_part1(self):
        self.assertEqual(day1.part_1('+1\n+1\n+1\n'), 3)
        self.assertEqual(day1.part_1('+1\n+1\n-2\n'), 0)
        self.assertEqual(day1.part_1('-1\n-2\n-3\n'), -6)

    def test_part2(self):
        self.assertEqual(day1.part_2('+1\n-1\n'), 0)
        self.assertEqual(day1.part_2('+3\n+3\n+4\n-2\n-4\n'), 10)
        self.assertEqual(day1.part_2('-6\n+3\n+8\n+5\n-6\n'), 5)
        self.assertEqual(day1.part_2('+7\n+7\n-2\n-7\n-4\n'), 14)
