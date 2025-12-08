# frozen_string_literal: true

class Day2
  def initialize(dimensions_file)
    @dimensions = File.readlines(dimensions_file, chomp: true).map { _1.split("x").map(&:to_i) }
  end

  def part_one
    @dimensions.sum do
      l, w, h = _1
      (2 * l * w) + (2 * w * h) + (2 * h * l) +
        _1.combination(2).map { |pair| pair.reduce(:*) }.min
    end
  end

  def part_two
    @dimensions.sum do
      _1.sort.take(2).map { |i| i * 2 }.sum + _1.reduce(:*)
    end
  end
end
