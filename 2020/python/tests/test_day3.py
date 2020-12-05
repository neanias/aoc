import pytest

from aoc import day3


@pytest.fixture
def slope(fixtures):
    with open(fixtures / "day3.txt") as df:
        data = df.read()
    return day3.Slope.from_string(data)


def test_parsing(slope, fixtures):
    with open(fixtures / "day3.txt") as df:
        lines = df.readlines()

    assert len(lines) == len(slope.lines)


def test_movement(slope):
    assert slope.pos == (0, 0)
    slope.next()
    assert slope.pos == (1, 3)


def test_tree_detection(slope):
    assert slope.tree is False
    slope.next()
    slope.next()
    assert slope.tree is True


def test_wrapping(slope):
    for _ in range(4):
        slope.next()
    assert slope.pos[1] == 1


def test_has_next_line(slope):
    assert slope.has_next is True

    for _ in range(10):
        slope.next()

    assert slope.has_next is False


def test_part_1(slope):
    assert slope.result() == 7


def test_part_2(fixtures, slope):
    with open(fixtures / "day3.txt") as df:
        data = df.read()

    slope_1 = day3.Slope.from_string(data, pattern=(1, 1))
    slope_1_result = slope_1.result()
    assert slope_1_result == 2

    slope_3 = day3.Slope.from_string(data, pattern=(1, 5))
    slope_3_result = slope_3.result()
    assert slope_3_result == 3

    slope_4 = day3.Slope.from_string(data, pattern=(1, 7))
    slope_4_result = slope_4.result()
    assert slope_4_result == 4

    slope_5 = day3.Slope.from_string(data, pattern=(2, 1))
    slope_5_result = slope_5.result()
    assert slope_5_result == 2

    assert slope_1_result * slope.result() * slope_3_result * slope_4_result * slope_5_result == 336
