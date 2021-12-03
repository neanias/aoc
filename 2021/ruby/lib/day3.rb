# frozen_string_literal: true

require "pp"

class Day3
  def initialize(diagnostic_file)
    @diagnostics = File.readlines(diagnostic_file, chomp: true)
    @columns = columns(@diagnostics)
    @min_per_column, @max_per_column = minmax_of_columns(@columns)
  end

  def part_one
    epsilon = @min_per_column.join
    gamma = @max_per_column.join
    epsilon.to_i(2) * gamma.to_i(2)
  end

  def part_two
    pp @max_per_column, @min_per_column
    oxygen_rating = rating2(@diagnostics, @max_per_column, direction: 1)
    p oxygen_rating
    co2_rating = rating2(@diagnostics, @min_per_column)
    p co2_rating
    oxygen_rating * co2_rating
  end

  private

  def rating(column_bits)
    arr = column_bits.each_with_index.reduce(@diagnostics) do |diagnostics, column_idx|
      break diagnostics if diagnostics.length == 1

      column, idx = column_idx
      darr = diagnostics.select { |diagnostic| diagnostic[idx] == column }
      pp darr
      darr
    end
    arr[0].to_i(2)
  end

  def rating2(diagnostics, column_bits, idx = 0, direction: 0)
    return diagnostics[0].to_i(2) if diagnostics.length == 1

    reduced_diagnostics = diagnostics.select { |diagnostic| diagnostic[idx] == column_bits[idx] }
    pp reduced_diagnostics
    new_column_bits = minmax_of_columns(columns(reduced_diagnostics))[direction]
    pp new_column_bits
    rating2(reduced_diagnostics, new_column_bits, idx + 1, direction: direction)
  end

  def columns(diagnostics)
    diagnostics.map(&:chars).transpose
  end

  def minmax_of_columns(columns)
    columns.lazy.map(&:tally).map { _1.lazy.sort.minmax_by(&:last).map(&:first) }.to_a.transpose
  end
end
