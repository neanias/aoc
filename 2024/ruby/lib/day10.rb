# frozen_string_literal: true

require "matrix"

class Day10
  def initialize(topographical_map)
    @map = Matrix[*File.readlines(topographical_map, chomp: true).map { _1.chars.map(&:to_i) }]
  end

  def part_one
    starting_positions = []
    @map.each_with_index { |el, r, c| starting_positions.push([r, c]) if el == 0 }

    starting_positions.sum { bfs(_1).size }
  end

  def part_two
    starting_positions = []
    @map.each_with_index { |el, r, c| starting_positions.push([r, c]) if el == 0 }

    starting_positions.sum { bfs_no_visited(_1).size }
  end

  def neighbours(row, column)
    [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ].reject do |pair|
      pair.any? { _1 < 0 || _1 >= @map.row_count }
    end
  end

  # Breadth first search to find all the nines
  def bfs(starting_position)
    frontier = Queue.new.push(starting_position)
    visited = Set.new([starting_position])
    nines = []

    until frontier.empty?
      current = frontier.pop
      current_num = @map[*current]
      neighbours(*current).each do |next_pos|
        next_num = @map[*next_pos]
        if !visited.include?(next_pos) && next_num == current_num + 1
          visited.add(next_pos)
          if next_num == 9
            nines.push(next_pos)
          else
            frontier.push(next_pos)
          end
        end
      end
    end

    nines
  end

  # Breadth first search to find all possible paths to nines
  def bfs_no_visited(starting_position)
    frontier = Queue.new.push(starting_position)
    nines = []

    until frontier.empty?
      current = frontier.pop
      current_num = @map[*current]
      neighbours(*current).each do |next_pos|
        next_num = @map[*next_pos]
        if next_num == current_num + 1
          if next_num == 9
            nines.push(next_pos)
          else
            frontier.push(next_pos)
          end
        end
      end
    end

    nines
  end
end
