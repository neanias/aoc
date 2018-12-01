from typing import List


def part_1(number_string: str) -> int:
    """Counts repeating numbers"""
    numbers: List[int] = listify(number_string)
    first_num: int = numbers[0]
    prev_num: int = None
    curr_num: int = None
    total: int = 0

    for num in numbers:
        prev_num = curr_num
        curr_num = num
        if prev_num == curr_num:
            total += curr_num

    if curr_num == first_num:
        total += curr_num

    return total


def part_2(number_string: str) -> int:
    numbers: List[int] = listify(number_string)
    total: int = 0
    for i in range(len(numbers)):
        oppo: int = paired_number(numbers, i)
        if numbers[i] == numbers[oppo]:
            total += numbers[i]

    return total


def paired_number(numbers: List[int], index: int) -> int:
    step = len(numbers) // 2
    oppo = index + step
    return oppo % len(numbers)


def listify(number_string: str) -> List[int]:
    int_string: List[int] = []
    for num in number_string:
        int_string.append(int(num))

    return int_string


if __name__ == "__main__":
    string = input("Captcha sequence: ")

    print(part_1(string))
    print(part_2(string))
