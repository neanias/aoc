# frozen_string_literal: true

require "matrix"

def day_7_part_1(tachy_map)
  matrix = Matrix[*tachy_map.lines(chomp: true).map(&:chars)]
  start_point = matrix.index("S")
  frontier = Set.new([start_point])
  split = 0
  until frontier.any? { !_1.between?(0, matrix.column_count - 1) || !_2.between?(0, matrix.row_count - 1) }
    new_frontier = Set.new
    frontier.each do |(row, col)|
      new_pos = [row + 1, col]
      if matrix[*new_pos] == "^"
        split += 1
        new_frontier.merge([[new_pos[0], col - 1], [new_pos[0], col + 1]])
      else
        new_frontier.add(new_pos)
      end
    end
    frontier = new_frontier
  end
  split
end
