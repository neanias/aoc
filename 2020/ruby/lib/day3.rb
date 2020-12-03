# frozen_string_literal: true

class Day3
  def initialize(tree_map)
    @tree_map = File.readlines(tree_map, chomp: true)
  end

  def part_1(x_coord: 3, y_coord: 1)
    coordinates = { x: x_coord, y: y_coord }
    sum = 0
    while coordinates[:y] < @tree_map.size
      x, y = coordinates[:x], coordinates[:y]
      x %= @tree_map[y].size
      tree_hit = @tree_map[y][x] == "#"
      sum += 1 if tree_hit
      coordinates[:x] += x_coord
      coordinates[:y] += y_coord
    end
    sum
  end


  def part_2(movements:)
    movements.reduce(1) { |product, pair| product * part_1(x_coord: pair[0], y_coord: pair[1]) }
  end
end
