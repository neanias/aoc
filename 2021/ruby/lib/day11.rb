# frozen_string_literal: true

require "matrix"
require "set"

class Day11
  def initialize(octopus_file)
    @octopuses = Matrix[*File.readlines(octopus_file, chomp: true).map { _1.chars.map(&:to_i) }]
  end

  def part_one
    octo = @octopuses.dup
    flashes = 0

    100.times do
      flashing = {}

      octo.each_with_index do |elem, row, col|
        octo[row, col] = elem + 1

        flashing.store([row, col], true) if elem + 1 > 9
      end

      while flashing.values.any?
        flashing.select { |_, v| v == true }.each_key do |pos|
          flashing[pos] = false
          octo[*pos] = 0

          neighbours(*pos, octo) do |neighbour|
            next if flashing.key?(neighbour)

            new_val = octo[*neighbour] += 1
            flashing.store(neighbour, true) if new_val > 9
          end
        end
      end

      flashes += flashing.size
    end

    flashes
  end

  def part_two
    octo = @octopuses.dup
    step = 0

    until octo.zero?
      flashing = {}

      octo.each_with_index do |elem, row, col|
        octo[row, col] = elem + 1

        flashing.store([row, col], true) if elem + 1 > 9
      end

      while flashing.values.any?
        flashing.select { |_, v| v == true }.each_key do |pos|
          flashing[pos] = false
          octo[*pos] = 0

          neighbours(*pos, octo) do |neighbour|
            next if flashing.key?(neighbour)

            new_val = octo[*neighbour] += 1
            flashing.store(neighbour, true) if new_val > 9
          end
        end
      end

      step += 1
    end

    step
  end

  private

  def neighbours(row, column, matrix)
    nbours = [
      [row, column + 1],
      [row, column - 1],
      [row + 1, column],
      [row - 1, column],
      [row + 1, column + 1],
      [row + 1, column - 1],
      [row - 1, column + 1],
      [row - 1, column - 1],
    ].reject do |(r, c)|
      pair = [r, c]
      pair.any?(-1) || r >= matrix.row_count || c >= matrix.column_count
    end

    if block_given?
      nbours.each { yield _1 }
    else
      nbours
    end
  end
end
