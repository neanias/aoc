# frozen_string_literal: true

class Day1
  def initialize(input_file)
    @input_pairs = File.readlines(input_file).map { |pair| pair.split.map(&:to_i) }
    @input_transpose = @input_pairs.transpose
  end

  def part_one
    left_list, right_list = *@input_transpose
    left_list.sort.zip(right_list.sort).sum { |(lhs, rhs)| (lhs - rhs).abs }
  end

  def part_two
    left_list, right_list = *@input_transpose
    right_list_nums = right_list.tally
    left_list.sum { |num| num * right_list_nums.fetch(num, 0) }
  end
end
