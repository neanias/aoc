def part1(number_string: str) -> int:
    """Counts repeating numbers"""
    first_num: int = int(number_string[0])
    prev_num: int = None
    curr_num: int = None
    total: int = 0

    for num in number_string:
        prev_num = curr_num
        curr_num = int(num)
        if prev_num == curr_num:
            total += curr_num

    if curr_num == first_num:
        total += curr_num

    return total


if __name__ == "__main__":
    string = input("Captcha sequence: ")

    print(part1(string))
