import os
from itertools import cycle
from typing import Iterator


def part_1(input_string: str) -> int:
    return sum(map(int, input_string.split()))


def part_2(frequency_changes: str) -> int:
    changes: Iterator[int] = map(int, frequency_changes.split())
    previous_frequencies: set = {0}
    current_frequency: int = 0

    for change in cycle(changes):
        current_frequency += change
        if current_frequency in previous_frequencies:
            break
        else:
            previous_frequencies.add(current_frequency)

    return current_frequency


if __name__ == "__main__":
    with open(os.path.join(os.path.dirname(__file__), "day1_input.txt")) as f:
        content: str = f.read()
        print(part_1(content))
        print(part_2(content))
