# frozen_string_literal: true

require "matrix"

def day_4_part_1(diagram)
  matrix = Matrix[*diagram.lines(chomp: true).map(&:chars)]
  accessible_rolls(matrix).size
end

def day_4_part_2(diagram)
  matrix = Matrix[*diagram.lines(chomp: true).map(&:chars)]
  total_rolls = matrix.count { it == "@" }
  until (removable = accessible_rolls(matrix)).empty?
    removable.each { |(_, row, col)| matrix[row, col] = "." }
  end
  total_rolls - matrix.count { it == "@" }
end

def accessible_rolls(matrix)
  matrix.each_with_index.select do |char, row, col|
    next false if char == "."
    neighbours(row, col)
      .reject { it[0] < 0 || it[1] < 0 || it[0] >= matrix.row_size || it[1] >= matrix.column_size }
      .count { matrix[*it] == "@" } < 4
  end
end

def neighbours(row, col)
  [
    [row + 1, col + 1],
    [row + 1, col - 1],
    [row + 1, col],
    [row - 1, col + 1],
    [row - 1, col - 1],
    [row - 1, col],
    [row, col + 1],
    [row, col - 1]
  ]
end
