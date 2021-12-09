# frozen_string_literal: true

require "matrix"
require "set"

class Day9
  def initialize(heightmap_file)
    @heightmap = Matrix[*File.readlines(heightmap_file, chomp: true).map { _1.chars.map(&:to_i) }]
  end

  def part_one
    find_low_points.map(&:first).sum(&:succ)
  end

  def part_two
    find_low_points.map(&:last).map(&method(:expand_basin)).map(&:size).sort.reverse.take(3).reduce(:*)
  end

  private

  def neighbours(row, column)
    [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ].reject do |(r, c)|
      pair = [r, c]
      pair.any?(-1) || r >= @heightmap.row_count || c >= @heightmap.column_count
    end
  end

  def find_low_points
    low_points = []

    @heightmap.each_with_index do |elem, row, column|
      indices = neighbours(row, column)

      low_points << [elem, [row, column]] if indices.all? { |(r, c)| @heightmap[r, c] > elem }
    end

    low_points
  end

  # Basically just breadth-first search, but stop at 9s
  def expand_basin(starting_position)
    frontier = Queue.new.push(starting_position)
    visited = Set.new([starting_position])

    until frontier.empty?
      current = frontier.pop
      neighbours(*current).each do |next_pos|
        if !visited.include?(next_pos) && @heightmap[*next_pos] != 9
          frontier.push(next_pos)
          visited.add(next_pos)
        end
      end
    end

    visited
  end
end
