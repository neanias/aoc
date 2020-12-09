# frozen_string_literal: true

class Day9
  def initialize(numbers_file, preamble_size = 25)
    @numbers = File.readlines(numbers_file, chomp: true).map(&:to_i)
    @preamble_size = preamble_size
  end

  def part_1
    @numbers.slice(@preamble_size..).lazy.with_index.find do |n, idx|
      @numbers.slice(idx, @preamble_size + idx).combination(2).lazy.find { |a, b| a + b == n }.nil?
    end[0]
  end

  def part_2(goal)
    last_index = nil
    first_index = (0..@numbers.size).lazy.find do |idx|
      found = search(idx, goal)
      last_index = found - 1 if found
    end

    @numbers[first_index..last_index].minmax.sum
  end

  private

  def search(idx, goal, acc = 0)
    return idx if acc == goal
    return nil if acc > goal
    num = @numbers[idx]
    new_index = idx + 1
    search(new_index, goal, acc + num)
  end
end
