# frozen_string_literal: true

class Day5
  Point = Struct.new(:x, y)

  def initialize(lines_file)
    @lines = File.readlines(lines_file, chomp: true).map do |line|
      line.split(" -> ").map { Point.new(*_1.split(",")) }
    end
  end
end
