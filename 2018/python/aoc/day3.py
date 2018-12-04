import os
from typing import Iterator, List, Tuple


class Claim:
    claim_id: int
    x: int
    y: int
    width: int
    height: int

    def __init__(self, claim_string: str):
        claim: List[str] = claim_string.split()
        self.claim_id = int(claim[0][1:])
        self.x, self.y = map(int, claim[2][:-1].split(','))
        self.width, self.height = map(int, claim[3].split('x'))

    def square_covered(self) -> Iterator[Tuple[int, int]]:
        return zip(range(self.x, self.x + self.width),
                   range(self.y, self.y + self.height))


def part_1(claims_string: str) -> int:
    claims_iter: Iterator[Claim] = map(Claim, claims_string.split())
    return 0


if __name__ == "__main__":
    with open(os.path.join(os.path.dirname(__file__), "day3_input.txt")) as f:
        content: str = f.read()
        print(part_1(content))
