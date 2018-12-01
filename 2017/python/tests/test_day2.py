import unittest
from aoc import day2

class TestDay2(unittest.TestCase):
    def test_part1(self):
        self.assertEqual(day2.part_1('5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8'), 18)

    def test_part2(self):
        self.assertEqual(day2.part_2('5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5'), 9)
