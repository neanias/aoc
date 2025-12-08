# frozen_string_literal: true

class Day1
  def initialize(instructions_file)
    @floor_instructions = File.read(instructions_file).chomp
  end

  def part_one
    @floor_instructions.chars.map { (_1 == "(") ? 1 : -1 }.reduce(:+)
  end

  def part_two
    char_count = 0
    sum = 0
    @floor_instructions.chars.map { (_1 == "(") ? 1 : -1 }.find.with_index do |num, idx|
      char_count += 1
      sum += num
      return char_count if sum == -1
    end
  end
end
