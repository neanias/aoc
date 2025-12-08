# frozen_string_literal: true

require "matrix"

class Day3
  def initialize(directions_file)
    @directions = File.read(directions_file).chomp.chars.map do |dir|
      case dir
      when "^"
        Vector[0, 1]
      when "v"
        Vector[0, -1]
      when "<"
        Vector[-1, 0]
      when ">"
        Vector[1, 0]
      end
    end
  end

  def part_one
    pos = Vector[0, 0]
    visited = Set.new([pos])
    @directions.each { visited.add(pos += _1) }
    visited.size
  end

  def part_two
    santa_pos = Vector[0, 0]
    robo_pos = Vector[0, 0]
    visited = Set.new([santa_pos])
    @directions.each_slice(2) do |(santa_dir, robo_dir)|
      santa_pos += santa_dir
      robo_pos += robo_dir
      visited.merge([santa_pos, robo_pos])
    end
    visited.size
  end
end
