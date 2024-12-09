# frozen_string_literal: true

require "matrix"

class Day6
  def initialize(map_file)
    @map = Matrix[*File.readlines(map_file).map(&:chars)]
  end

  def part_one
    positions = Set.new
    rotation = {"^" => ">", ">" => "v", "v" => "<", "<" => "^"}.freeze
    guard_direction = {"^" => Vector[-1, 0], ">" => Vector[0, 1], "v" => Vector[1, 0], "<" => Vector[0, -1]}.freeze
    guard = "^"
    guard_pos = Vector[*@map.index(guard)]

    until guard_pos.any? { _1 >= @map.row_size || _1 < 0 }
      positions.add(guard_pos)

      new_pos = guard_pos + guard_direction[guard]
      break if new_pos.any? { _1 >= @map.row_size || _1 < 0 }

      char = @map[*new_pos]
      if char == "." || char == "^"
        guard_pos = new_pos
      elsif char == "#"
        guard = rotation[guard]
      end
    end

    positions.size
  end
end
