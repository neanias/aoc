# typed: true
# frozen_string_literal: true

require "matrix"
require "csv"
require "set"

class Day14
  def initialize(rocks_file)
    @rocks = File.readlines(rocks_file, chomp: true).flat_map do |rock_line|
      rocks = CSV.parse(rock_line, row_sep: " -> ", converters: :integer).map { Vector[*_1] }
      rocks.each_cons(2).flat_map { |(start, stop)| generate_points(start, stop) }.uniq
    end.to_set
    @sand_start_point = Vector[500, 0]
  end

  def part_one
    sand_pos = @sand_start_point
    cutoff = @rocks.max_by { _1[-1] }
    blocked = @rocks.dup

    loop do
      break if sand_pos[-1] == cutoff[-1]

      sand_pos = @sand_start_point

      # Continue whilst we can
      loop do
        break if sand_pos[-1] == cutoff[-1]

        left, below, right = possible_movements(sand_pos)

        if !blocked.include?(below)
          sand_pos = below
        elsif !blocked.include?(left)
          sand_pos = left
        elsif !blocked.include?(right)
          sand_pos = right
        else
          blocked.add(sand_pos)
          break
        end
      end
    end

    blocked.size - @rocks.size
  end

  def part_two
    sand_pos = @sand_start_point
    bottom = @rocks.max_by { _1[-1] } + Vector[0, 2]
    blocked = @rocks.dup

    loop do
      break if blocked.include?(@sand_start_point)

      sand_pos = @sand_start_point

      loop do
        left, below, right = possible_movements(sand_pos)

        if below[-1] < bottom[-1] && !blocked.include?(below)
          sand_pos = below
        elsif !blocked.include?(left) && left[-1] < bottom[-1]
          sand_pos = left
        elsif !blocked.include?(right) && right[-1] < bottom[-1]
          sand_pos = right
        else
          blocked.add(sand_pos)
          break
        end
      end
    end

    blocked.size - @rocks.size
  end

  private

  def possible_movements(sand_vector)
    [Vector[-1, 1], Vector[0, 1], Vector[1, 1]].map { _1 + sand_vector }
  end

  # Bresenham's line algorithm. Defo overkill
  def generate_points(start_vector, end_vector)
    diff_vector = end_vector - start_vector
    x0, y0 = *start_vector
    x1, y1 = *end_vector

    dx = diff_vector[0].abs
    sx = x0 < x1 ? 1 : -1
    dy = -diff_vector[1].abs
    sy = y0 < y1 ? 1 : -1
    error = dx + dy

    arr = []
    loop do
      arr.push(Vector[x0, y0])
      break if x0 == x1 && y0 == y1

      e2 = 2 * error
      if e2 >= dy
        break if x0 == x1

        error += dy
        x0 += sx
      end

      next unless e2 <= dx
      break if y0 == y1

      error += dx
      y0 += sy
    end

    arr
  end
end
