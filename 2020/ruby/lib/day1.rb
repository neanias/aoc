# frozen_string_literal: true

class Day1
  def initialize(file)
    @numbers = File.readlines(file, chomp: true).map(&:to_i)
  end

  def part_1
    @numbers.map { |n| 2020 - n }.intersection(@numbers).reduce(:*)
  end

  def part_2
    @numbers.combination(3).lazy.find { |n, n2, n3| n + n2 + n3 == 2020 }.reduce(:*)
  end
end
