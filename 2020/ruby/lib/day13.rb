# frozen_string_literal: true

class Day13
  def initialize(bus_notes)
    timestamp, buses = File.readlines(bus_notes, chomp: true)
    @timestamp = timestamp.to_i
    @buses = buses.split(",")
  end

  def part_1
    @buses.lazy
      .reject { _1 == "x" }
      .map(&:to_i)
      .map { [_1, (_1 * ((@timestamp / _1) + 1)) % @timestamp] }
      .min_by(&:last)
      .reduce(:*)
  end

  def part_2
    bus_with_offset = @buses.map.with_index { [_1, _2] }.reject { |n, _| n == "x" }
  end
end
