# frozen_string_literal: true

require "matrix"

class Day8
  def initialize(frequencies_file)
    @frequencies = Matrix[*File.readlines(frequencies_file, chomp: true).map(&:chars)]
  end

  def part_one
    antennas = Hash.new { |h, k| h[k] = [] }
    @frequencies.each_with_index { |el, row, col| antennas[el].append(Vector[row, col]) if el.match?(/[A-Za-z0-9]/) }
    antinodes = Set.new
    antennas.each_pair do |letter, coords|
      coords.combination(2).each do |left, right|
        antinode_0 = left - right
        unless (left + antinode_0).any? { _1 < 0 || _1 >= @frequencies.row_size }
          antinodes.add(left + antinode_0)
        end
        antinode_1 = right - left
        unless (right + antinode_1).any? { _1 < 0 || _1 >= @frequencies.row_size }
          antinodes.add(right + antinode_1)
        end
      end
    end
    antinodes.size
  end

  def part_two
  end
end
