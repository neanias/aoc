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
    antennas.each_value do |coords|
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
    antennas = Hash.new { |h, k| h[k] = [] }
    @frequencies.each_with_index { |el, row, col| antennas[el].append(Vector[row, col]) if el.match?(/[A-Za-z0-9]/) }
    antinodes = Set.new
    antennas.each_pair do |freq, coords|
      coords.combination(2).each do |left, right|
        direction = right - left
        new_left = left.clone
        until (new_left + direction).any? { _1 < 0 || _1 >= @frequencies.row_size }
          new_left += direction
          antinodes.add(new_left.clone)
        end
        new_right = right.clone
        until (new_right - direction).any? { _1 < 0 || _1 >= @frequencies.row_size }
          new_right -= direction
          antinodes.add(new_right.clone)
        end

        antinodes.add(left - direction) unless (left - direction).any? { _1 < 0 || _1 >= @frequencies.row_size }
        antinodes.add(right + direction) unless (right + direction).any? { _1 < 0 || _1 >= @frequencies.row_size }
      end
    end

    antinodes.size
  end
end
