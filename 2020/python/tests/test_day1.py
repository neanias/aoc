from aoc import day1


def test_part1(fixtures):
    with open(fixtures / "day1.txt") as df:
        data = df.read()

    assert 514579 == day1.part1(data)


def test_part2(fixtures):
    with open(fixtures / "day1.txt") as df:
        data = df.read()

    assert 241861950 == day1.part2(data)
