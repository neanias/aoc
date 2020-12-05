from aoc import day2


def test_part1(fixtures):
    with open(fixtures / "day2.txt") as df:
        data = df.read()

    assert 2 == day2.part1(data)


def test_part2(fixtures):
    with open(fixtures / "day2.txt") as df:
        data = df.read()

    assert 1 == day2.part2(data)


def test_part2_validator_first():
    assert day2.part2_validator("1-3 a", "abcde") is True

def test_part2_validator_last():
    assert day2.part2_validator("1-3 b", "cdbfg") is True

def test_part2_validator_once():
    assert day2.part2_validator("1-3 b", "cdefg") is False

def test_part2_validator_only_once():
    assert day2.part2_validator("2-9 c", "ccccccccc") is False
