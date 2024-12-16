# frozen_string_literal: true

require "matrix"

class Day14
  Robot = Struct.new("Robot", :position, :velocity)

  def initialize(robots_file, width = 11, height = 7)
    @robots = File.readlines(robots_file, chomp: true).map do |line|
      pos, vel = line.split(" ")
      pos_vec = Vector[*pos.split("p=")[-1].split(",").map(&:to_i)]
      vel_vec = Vector[*vel.split("v=")[-1].split(",").map(&:to_i)]
      Robot.new(pos_vec, vel_vec)
    end
    @width = width
    @height = height
  end

  def part_one
    robots = @robots.map { _1.dup }

    100.times do
      robots.length.times do |i|
        robot = robots[i]
        pos = robot.position
        pos += robot.velocity
        if pos[0] < 0
          pos[0] += @width
        elsif pos[0] >= @width
          pos[0] -= @width
        end
        if pos[1] < 0
          pos[1] += @height
        elsif pos[1] >= @height
          pos[1] -= @height
        end

        robots[i].position = pos
      end
    end

    quadrants = Hash.new(0)
    robots.each do |robot|
      mid_width = @width / 2
      mid_height = @height / 2
      if robot.position[0] < mid_width && robot.position[1] < mid_height
        quadrants[:tl] += 1
      elsif robot.position[0] < mid_width && robot.position[1] > mid_height
        quadrants[:bl] += 1
      elsif robot.position[0] > mid_width && robot.position[1] < mid_height
        quadrants[:tr] += 1
      elsif robot.position[0] > mid_width && robot.position[1] > mid_height
        quadrants[:br] += 1
      end
    end

    quadrants.values.reduce(:*)
  end

  def part_two
    robots = @robots.map { _1.dup }
    100.times do |second|
      if second % 5 == 0
        render_robots(robots)
        puts "Second #{second}"
      end

      robots.length.times do |i|
        robot = robots[i]
        pos = robot.position
        pos += robot.velocity
        if pos[0] < 0
          pos[0] += @width
        elsif pos[0] >= @width
          pos[0] -= @width
        end
        if pos[1] < 0
          pos[1] += @height
        elsif pos[1] >= @height
          pos[1] -= @height
        end

        robots[i].position = pos
      end
    end
  end

  def render_robots(robots)
    (0...@height).each do |row|
      (0...@width).each do |col|
        puts if col == 0
        count = robots.count { _1.position == Vector[col, row] }
        print (count == 0) ? "." : count
      end
    end

    puts
  end
end
