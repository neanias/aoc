# frozen_string_literal: true

require "matrix"
require "pqueue"

class Day16
  def initialize(map_file)
    @map = Matrix[*File.readlines(map_file, chomp: true).map(&:chars)]
    @start = @map.index("S")
    @end = @map.index("E")
  end

  def part_one
    _paths, costs = a_star(@map, @start, @end)
    costs[@end]
  end

  # Taxicab distance
  def heuristic(start, goal)
    (start[0] - goal[0]).abs + (start[1] - goal[1]).abs
  end

  def neighbours(grid, row, column)
    [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ].reject do |pair|
      pair.any? { _1 < 0 || _1 >= grid.row_count } || grid[*pair] == "#"
    end
  end

  # Taxicab distance
  def cost(direction, start, goal)
    difference = Vector[*start] - Vector[*goal]
    case difference
    when Vector[-1, 0]
      return 1 if direction == :north
      return 1001 if direction == :east || direction == :west
      2001 if direction == :south
    when Vector[0, -1]
      return 1 if direction == :west
      return 1001 if direction == :north || direction == :south
      2001 if direction == :east
    when Vector[1, 0]
      return 1 if direction == :south
      return 1001 if direction == :east || direction == :west
      2001 if direction == :north
    when Vector[0, 1]
      return 1 if direction == :east
      return 1001 if direction == :south || direction == :north
      2001 if direction == :west
    end
  end

  def new_direction(current, neighbour)
    difference = Vector[*current] - Vector[*neighbour]
    case difference
    when Vector[-1, 0]
      :north
    when Vector[0, -1]
      :west
    when Vector[1, 0]
      :south
    when Vector[0, 1]
      :east
    end
  end

  def a_star(grid, start, goal)
    frontier = PQueue.new
    frontier.push([0, start, :east])
    came_from = {}
    cost_so_far = {}
    came_from[start] = nil
    cost_so_far[start] = 0

    until frontier.empty?
      _, current, direction = frontier.pop
      break if current == goal
      neighbours(grid, *current).each do |neighbour|
        new_cost = cost_so_far[current] + cost(direction, current, neighbour)
        if !cost_so_far.key?(new_cost) || new_cost < cost_so_far[neighbour]
          cost_so_far[neighbour] = new_cost
          priority = new_cost + heuristic(neighbour, goal)
          neighbour_direction = new_direction(current, neighbour)
          frontier.push([priority, neighbour, neighbour_direction])
          came_from[neighbour] = current
        end
      end
    end

    [came_from, cost_so_far]
  end
end
