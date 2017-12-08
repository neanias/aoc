from typing import List, Set
import os


def part_1_validator(passphrase: str) -> bool:
    phrases: List[str] = passphrase.strip().split(" ")
    return len(set(phrases)) == len(phrases)


def part_1(passphrases: str) -> int:
    total_valid: int = 0
    for phrase in passphrases.strip().split("\n"):
        if part_1_validator(phrase):
            total_valid += 1

    return total_valid


def part_2_validator(passphrase: str) -> bool:
    phrases: List[str] = passphrase.strip().split(" ")
    sorted_phrases = set(map(lambda phrase: " ".join(sorted(phrase)),
                             phrases))
    return len(set(sorted_phrases)) == len(phrases)


def part_2(passphrases: str) -> int:
    total_valid: int = 0
    for passphrase in passphrases.strip().split("\n"):
        if part_2_validator(passphrase):
            total_valid += 1

    return total_valid


if __name__ == "__main__":
    input_path = os.path.join(os.path.dirname(__file__), 'day4_input.txt')
    content: str = None
    with open(input_path, 'r') as day_input:
        content = day_input.read()

    print(part_1(content))
    print(part_2(content))
