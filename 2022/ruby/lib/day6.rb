# typed: true
# frozen_string_literal: true

class Day6
  def initialize(signal_file)
    @signal = File.readlines(signal_file, chomp: true).first
  end

  def part_one
    find_marker(4)
  end

  def part_two
    find_marker(14)
  end

  private

  def find_marker(size)
    count = 0
    @signal.chars.each_cons(size).each do |substr|
      if substr.uniq.size == size
        count += size
        break
      end
      count += 1
    end

    count
  end
end