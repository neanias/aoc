# frozen_string_literal: true

class Day11
  def initialize(stones_file)
    @stones = File.read(stones_file, chomp: true).split.map(&:to_i)
  end

  def part_one = generate_stones(@stones, 25)

  def part_two = generate_stones(@stones, 75)

  def generate_stones(stones, times)
    stones = stones.tally
    stones.default = 0

    times.times do |round|
      stones.delete_if { _2 <= 0 }
      current = stones.dup
      current.each do |stone, count|
        stones[stone] -= count
        if stone == 0
          stones[1] += count
        elsif stone.digits.length.even?
          stone.digits.reverse.each_slice(stone.digits.length / 2).map { _1.join.to_i }.each { stones[_1] += count }
        else
          stones[stone * 2024] += count
        end
      end
    end

    stones.values.reject { _1 < 0 }.sum
  end
end
