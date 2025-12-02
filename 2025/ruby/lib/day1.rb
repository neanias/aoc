# frozen_string_literal: true

def part_1(instructions)
  starting_point = 50

  instructions.each_line(chomp: true).count do |inst|
    num = inst.tr("LR", "-+").to_i
    starting_point += num
    starting_point %= 100
    starting_point.zero?
  end
end

def part_2(instructions, debug = false)
  starting_point = 50

  instructions.each_line(chomp: true).sum do |inst|
    num = inst.tr("LR", "-+").to_i
    old_starting_point = starting_point
    starting_point += num
    zeros_passed, starting_point = starting_point.divmod(100)
    zeros_passed = zeros_passed.abs

    zeros_passed -= 1 if starting_point == 0 && num.positive?
    zeros_passed -= 1 if old_starting_point == 0 && num.negative?
    zeros_passed += 1 if starting_point == 0

    zeros_passed
  end
end
