# frozen_string_literal: true

class Day4
  def initialize(scratchcards_file)
    @scratchcards = File.readlines(scratchcards_file, chomp: true).map do |card|
      _, nums = card.split(": ")
      winners, have = nums.split(" | ")
      winners = winners.split(" ").map { _1.to_i }
      have = have.split(" ").map { _1.to_i }
      [winners, have]
    end
  end

  def part_one
    @scratchcards.sum do |(winners, have)|
      intersection = winners.intersection(have)
      next 0 if intersection.empty?

      1 << (intersection.length - 1).clamp(0..)
    end
  end

  def part_two
    copies = {}
    @scratchcards.length.times { copies[_1] = 1 }

    @scratchcards.each_with_index do |(winners, have), idx|
      intersection = winners.intersection(have)
      next if intersection.empty?
      (idx + 1).upto((idx + intersection.length).clamp(..@scratchcards.length - 1)) { copies[_1] += copies[idx] }
    end

    copies.values.sum
  end
end
