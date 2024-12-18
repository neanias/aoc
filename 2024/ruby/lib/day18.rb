# frozen_string_literal: true

require "matrix"

class Day18
  def initialize(bytes_file, test = true)
    @bytes = File.readlines(bytes_file, chomp: true).map { _1.split(",").map(&:to_i).reverse }
    @test = test
  end

  def part_one
    grid = Matrix.build(@test ? 7 : 71) { "." }
    @bytes.take(@test ? 12 : 1024).each { grid[*_1] = "#" }
    path = a_star(grid, [0, 0], @test ? [6, 6] : [70, 70])
    # Take one off for starting position
    path.size - 1
  end

  def part_two
    grid = Matrix.build(@test ? 7 : 71) { "." }
    @bytes.take(@test ? 12 : 1024).each { grid[*_1] = "#" }
    next_byte_idx = @test ? 12 : 1024
    grid[*@bytes[next_byte_idx]] = "#"
    until a_star(grid, [0, 0], @test ? [6, 6] : [70, 70]).empty?
      next_byte_idx += 1
      grid[*@bytes[next_byte_idx]] = "#"
    end
    @bytes[next_byte_idx].reverse
  end

  def draw_grid(grid)
    grid.each_with_index do |el, row, col|
      puts if col == 0
      print el
    end
    puts
  end

  def neighbours(grid, row, column)
    [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ].reject do |pair|
      pair.any? { _1 < 0 || _1 >= grid.row_count } || grid[*pair] == "#"
    end
  end

  # Taxicab distance
  def heuristic(start, goal)
    (start[0] - goal[0]).abs + (start[1] - goal[1]).abs
  end

  def reconstruct_path(came_from, current)
    total_path = [current]
    while came_from.key?(current)
      current = came_from[current]
      total_path.push(current)
    end
    total_path
  end

  def a_star(grid, start, goal)
    open_set = Set.new([start])
    came_from = {}
    g_score = Hash.new(Float::INFINITY)
    g_score[start] = 0

    f_score = Hash.new(Float::INFINITY)
    f_score[start] = heuristic(start, goal)

    until open_set.empty?
      current = open_set.min_by { f_score[_1] }
      return reconstruct_path(came_from, current) if current == goal

      open_set.delete(current)
      neighbours(grid, *current).each do |neighbour|
        tentative_gscore = g_score[current] + heuristic(current, neighbour)
        if tentative_gscore < g_score[neighbour]
          came_from[neighbour] = current
          g_score[neighbour] = tentative_gscore
          f_score[neighbour] = tentative_gscore + heuristic(neighbour, goal)
          unless open_set.include?(neighbour)
            open_set.add(neighbour)
          end
        end
      end
    end

    # No path found
    []
  end
end
