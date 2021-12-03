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
    oxygen_rating = rating(@diagnostics, direction: 1)
    co2_rating = rating(@diagnostics)
    oxygen_rating * co2_rating
  end

  private

  def rating(diagnostics, idx: 0, direction: 0)
    return diagnostics[0].to_i(2) if diagnostics.length == 1

    column_bits = minmax_of_columns(columns(diagnostics))[direction]
    reduced_diagnostics = diagnostics.select { |diagnostic| diagnostic[idx] == column_bits[idx] }

    rating(reduced_diagnostics, idx: idx + 1, direction: direction)
  end

  def columns(diagnostics)
    diagnostics.map(&:chars).transpose
  end

  def minmax_of_columns(columns)
    columns.lazy.map(&:tally).map { _1.minmax_by(&:reverse).map(&:first) }.to_a.transpose
  end
end
