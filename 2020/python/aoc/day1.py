from functools import reduce
from itertools import combinations


def part1(data: str) -> int:
    numbers = [int(line) for line in data.split()]
    subtracted = map(lambda x: 2020 - x, numbers)
    return reduce(lambda x, y: x * y, filter(lambda x: x in numbers, subtracted))


def part2(data: str) -> int:
    numbers = map(int, data.split())
    for (a, b, c) in combinations(numbers, 3):
        if a + b + c == 2020:
            return a * b * c
