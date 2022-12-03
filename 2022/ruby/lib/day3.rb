# typed: true
# frozen_string_literal: true

class Day3
  def initialize(item_file)
    @rucksacks = File.readlines(item_file, chomp: true)
  end

  def part_one
    @rucksacks.sum do |rucksack|
      contents = rucksack.chars
      size = contents.length
      lhs = contents[...size/2]
      rhs = contents[size/2..]
      lhs.intersection(rhs).map { calculate_priority(_1) }.first
    end
  end

  def part_two
    @rucksacks.each_slice(3).sum do |group|
      chars = group.map(&:chars)
      (chars[0] & chars[1] & chars[2]).map { calculate_priority(_1) }.first
    end
  end

  private

  def calculate_priority(char)
    if char in ("a".."z")
      (char.ord % 97) + 1
    else
      (char.ord % 65) + 27
    end
  end
end
