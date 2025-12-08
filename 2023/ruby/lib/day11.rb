# frozen_string_literal: true

require "matrix"

class Day11
  def initialize(map_file)
    @galaxy_map = Matrix[*File.readlines(map_file, chomp: true).map(&:chars)]
  end

  def part_one
    galaxy_row_expanse = @galaxy_map.to_a
    added_rows = 0
    @galaxy_map.row_vectors.each_with_index do |row, idx|
      if row.all?(".")
        galaxy_row_expanse.insert(idx + added_rows, row.to_a)
        added_rows += 1
      end
    end

    # We need to transpose before we insert new columns
    galaxy_column_expanse = galaxy_row_expanse.transpose
    added_columns = 0
    Matrix[*galaxy_column_expanse].row_vectors.each_with_index do |col, idx|
      if col.all?(".")
        galaxy_column_expanse.insert(idx + added_columns, col.to_a)
        added_columns += 1
      end
    end

    galaxy = Matrix[*galaxy_column_expanse.transpose]
    galaxies = Set.new
    galaxy.each_with_index { galaxies.add([_2, _3]) if _1 == "#" }
    galaxies.to_a.combination(2).sum do |(g1, g2)|
      (g1[0] - g2[0]).abs + (g1[1] - g2[1]).abs
    end
  end

  def part_two
    galaxy_row_expanse = @galaxy_map.to_a
    added_rows = 0
    @galaxy_map.row_vectors.each_with_index do |row, idx|
      if row.all?(".")
        999_999.times do
          galaxy_row_expanse.insert(idx + added_rows, row.to_a)
          added_rows += 1
        end
      end
    end

    # We need to transpose before we insert new columns
    galaxy_column_expanse = galaxy_row_expanse.transpose
    added_columns = 0
    Matrix[*galaxy_column_expanse].row_vectors.each_with_index do |col, idx|
      if col.all?(".")
        999_999.times do
          galaxy_column_expanse.insert(idx + added_columns, col.to_a)
          added_columns += 1
        end
      end
    end

    galaxy = Matrix[*galaxy_column_expanse.transpose]
    galaxies = Set.new
    galaxy.each_with_index { galaxies.add([_2, _3]) if _1 == "#" }
    galaxies.to_a.combination(2).sum do |(g1, g2)|
      (g1[0] - g2[0]).abs + (g1[1] - g2[1]).abs
    end
  end
end
