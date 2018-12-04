import os
from collections import defaultdict
from typing import DefaultDict, Dict, List


def part_1(box_ids_string: str) -> int:
    box_ids: List[str] = box_ids_string.split()
    counts: Dict[str, int] = {"twos": 0, "threes": 0}

    for box_id in box_ids:
        letters: DefaultDict[str, int] = defaultdict(int)
        for char in box_id:
            letters[char] += 1

        values = set(letters.values())
        if 2 in values:
            counts["twos"] += 1
        if 3 in values:
            counts["threes"] += 1

    return counts["twos"] * counts["threes"]


if __name__ == "__main__":
    with open(os.path.join(os.path.dirname(__file__), "day2_input.txt")) as f:
        content: str = f.read()
        print(part_1(content))
