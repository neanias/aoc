from aoc import day1
import unittest


class TestDay1(unittest.TestCase):
    def test_part1(self):
        self.assertEqual(day1.part_1('1122'), 3)
        self.assertEqual(day1.part_1('1111'), 4)
        self.assertEqual(day1.part_1('1234'), 0)
        self.assertEqual(day1.part_1('91212129'), 9)

    def test_part2(self):
        self.assertEqual(day1.part_2('1212'), 6)
        self.assertEqual(day1.part_2('1221'), 0)
        self.assertEqual(day1.part_2('123425'), 4)
        self.assertEqual(day1.part_2('123123'), 12)
        self.assertEqual(day1.part_2('12131415'), 4)
