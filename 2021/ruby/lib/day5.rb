# frozen_string_literal: true

class Day5
  def initialize(lines_file)
    @lines = File.readlines(lines_file, chomp: true).map do |line|
      line.split(" -> ").map { |segment| segment.split(",").map(&:to_i) }
    end
  end

  def part_one
    vents = Hash.new { |h, k| h[k] = 0 }

    @lines.each do |(x_1, y_1), (x_2, y_2)|
      # Ignore diagonal lines
      if x_1 == x_2
        lower_y, higher_y = [y_1, y_2].sort
        lower_y.upto(higher_y) { |y| vents["#{x_1},#{y}"] += 1 }
      elsif y_1 == y_2
        lower_x, higher_x = [x_1, x_2].sort
        lower_x.upto(higher_x) { |x| vents["#{x},#{y_1}"] += 1 }
      end
    end

    vents.count { |_, v| v > 1 }
  end

  # There is probably a much cleaner way of doing this.
  def part_two
    vents = Hash.new { |h, k| h[k] = 0 }

    @lines.each do |(x_1, y_1), (x_2, y_2)|
      if x_1 == x_2
        lower_y, higher_y = [y_1, y_2].sort
        lower_y.upto(higher_y) { |y| vents["#{x_1},#{y}"] += 1 }
      elsif y_1 == y_2
        lower_x, higher_x = [x_1, x_2].sort
        lower_x.upto(higher_x) { |x| vents["#{x},#{y_1}"] += 1 }
      elsif x_1 < x_2 && y_1 < y_2
        # e.g. 1,1 -> 3,3
        size = (x_2 - x_1) + 1
        size.times { |i| vents["#{x_1 + i},#{y_1 + i}"] += 1 }
      elsif x_1 > x_2 && y_1 > y_2
        # e.g. 6,4 -> 2,0
        size = (x_1 - x_2) + 1
        size.times { |i| vents["#{x_2 + i},#{y_2 + i}"] += 1 }
      elsif x_1 > x_2 && y_1 < y_2
        # e.g. 9,7 -> 7,9
        size = (x_1 - x_2) + 1
        size.times { |i| vents["#{x_1 - i},#{y_1 + i}"] += 1 }
      elsif x_1 < x_2 && y_1 > y_2
        # e.g. 5,5 -> 8,2
        size = (x_2 - x_1) + 1
        size.times { |i| vents["#{x_1 + i},#{y_1 - i}"] += 1 }
      end
    end

    vents.count { |_, v| v > 1 }
  end
end
