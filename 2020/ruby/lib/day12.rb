# frozen_string_literal: true

class Day12
  def initialize(directions_file)
    @directions = File.readlines(directions_file, chomp: true).map do |direction|
      { action: direction[0], value: direction[1..].to_i }
    end
  end

  def part_1
    heading = 90
    position = [0, 0]
    @directions.each do |direction|
      if direction[:action] == "L"
        heading = (heading - direction[:value]) % 360
      elsif direction[:action] == "R"
        heading = (heading + direction[:value]) % 360
      else
        direction[:action] = heading_to_direction(heading) if direction[:action] == "F"
        calculate_position_delta(direction).each_with_index { |n, idx| position[idx] += n }
      end
    end

    position.map(&:abs).sum
  end

  def part_2
    ship_position = [0, 0]
    waypoint_position = [1, 10]

    @directions.each do |direction|
      if direction[:action] == "L"
        (direction[:value] / 90r).numerator.times do
          waypoint_position = waypoint_position[1], -waypoint_position[0]
        end
      elsif direction[:action] == "R"
        (direction[:value] / 90r).numerator.times do
          waypoint_position = -waypoint_position[1], waypoint_position[0]
        end
      elsif direction[:action] == "F"
        waypoint_position.each_with_index { |n, idx| ship_position[idx] += n * direction[:value] }
      else
        calculate_position_delta(direction).each_with_index { |n, idx| waypoint_position[idx] += n }
      end
    end

    ship_position.map(&:abs).sum
  end

  private

  def calculate_position_delta(direction)
    case direction[:action]
    when "N"
      [direction[:value], 0]
    when "E"
      [0, direction[:value]]
    when "S"
      [-direction[:value], 0]
    when "W"
      [0, -direction[:value]]
    end
  end

  def heading_to_direction(heading)
    case heading
    when 0
      "N"
    when 90
      "E"
    when 180
      "S"
    when 270
      "W"
    end
  end
end
