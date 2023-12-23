# frozen_string_literal: true

class Day6
  def initialize(races_file)
    races = File.readlines(races_file, chomp: true).map { _1.split(":")[1].split.map(&:to_i) }
    @times = races[0]
    @distances = races[1]
    @races = races.transpose
  end

  def part_one
    @races.reduce(1) do |acc, (time, dist)|
      times = 1...time
      acc * times.count do |i|
        (time - i) * i > dist
      end
    end
  end

  def part_two
    time = @times.map(&:to_s).join.to_i
    dist = @distances.map(&:to_s).join.to_i
    times = 1...time
    times.count do |i|
      (time - i) * i > dist
    end
  end
end
