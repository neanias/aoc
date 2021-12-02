# frozen_string_literal: true

class Day2
  def initialize(commands_file)
    @commands = File.readlines(commands_file, chomp: true).lazy.map do |command|
      order, distance = command.split
      [order, distance.to_i]
    end
  end

  def part_one
    horizontal = 0
    depth = 0

    @commands.each do |command|
      order, dist = command
      case order
      when "forward"
        horizontal += dist
      when "up"
        depth -= dist
      when "down"
        depth += dist
      end
    end

    horizontal * depth
  end

  def part_two
    horizontal = 0
    depth = 0
    aim = 0

    @commands.each do |command|
      order, dist = command
      case order
      when "forward"
        horizontal += dist
        depth += aim * dist
      when "up"
        aim -= dist
      when "down"
        aim += dist
      end
    end

    horizontal * depth
  end
end
