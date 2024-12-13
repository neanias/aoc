# frozen_string_literal: true

require "matrix"

class Day12
  def initialize(garden_plots)
    @garden_plots = Matrix[*File.readlines(garden_plots, chomp: true).map(&:chars)]
  end

  def part_one
    beds = []
    @garden_plots.each_with_index do |plant, row, col|
      next if beds.any? { _1.include?([row, col]) }

      beds.append(build_shape([row, col], plant))
    end

    beds.sum { _1.size * calculate_perimeter(_1) }
  end

  def part_two
    beds = []
    @garden_plots.each_with_index do |plant, row, col|
      next if beds.any? { _1.include?([row, col]) }

      beds.append(build_shape([row, col], plant))
    end

    beds.sum { _1.size * calculate_sides(_1) }
  end

  def neighbours(row, column, reject = true)
    new_pairs = [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ]

    if reject
      return new_pairs.reject do |pair|
        pair.any? { _1 < 0 || _1 >= @garden_plots.row_size }
      end
    end

    new_pairs
  end

  def build_shape(starting_position, plant)
    frontier = Queue.new.push(starting_position)
    visited = Set.new([starting_position])

    until frontier.empty?
      current = frontier.pop
      neighbours(*current).each do |next_pos|
        if !visited.include?(next_pos) && @garden_plots[*next_pos] == plant
          frontier.push(next_pos)
          visited.add(next_pos)
        end
      end
    end

    visited
  end

  def calculate_perimeter(bed)
    return 4 if bed.size == 1
    return 6 if bed.size == 2
    return 8 if bed.size == 3

    bed.sum do |r, c|
      edges = neighbours(r, c, false)
      edges.sum do |e_r, e_c|
        if e_r < 0 || e_c < 0 || e_r >= @garden_plots.row_size || e_c >= @garden_plots.column_size
          1
        else
          neighbour = @garden_plots[e_r, e_c]
          plant = @garden_plots[r, c]
          (neighbour == plant) ? 0 : 1
        end
      end
    end
  end

  def find_corners(bed, garden_plots)
    corners = []
    bed.each do |pos|
      edges = neighbours(garden_plots, *pos, false)
      count = edges.count do |edge|
        neighbour = garden_plots[*edge]
        plant = garden_plots[*pos]
        edge.any? { _1 < 0 || _1 >= garden_plots.row_size } || neighbour != plant
      end

      if count > 1
        corners.concat([pos] * count)
      end
    end

    corners
  end

  def calculate_sides(bed)
    return 4 if bed.size == 1 || bed.size == 2

    corners = []
    bed.each do |pos|
      edges = neighbours(*pos, false)
      edge_count = edges.count do |edge|
        neighbour = @garden_plots[*edge]
        plant = @garden_plots[*pos]
        edge.any? { _1 < 0 || _1 >= @garden_plots.row_size } || neighbour != plant
      end

      if edge_count >= 2
        corners.push(pos)
      end
    end

    corners.size * 2
  end
end
