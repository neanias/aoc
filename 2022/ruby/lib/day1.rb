# frozen_string_literal: true

class Day1
  def initialize(input_file)
    @calories = File.read(input_file).split("\n\n").map { _1.split.map(&:to_i) }.map(&:sum)
  end

  def part_one
    @calories.max
  end

  def part_two
    @calories.sort.last(3).sum
  end
end
