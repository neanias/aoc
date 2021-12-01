# frozen_string_literal: true

class Day1
  def initialize(readings_file)
    @readings = File.read(readings_file).split.map(&:to_i)
  end

  def part_one
    @readings.lazy.then(&method(:count_increasing_slices))
  end

  def part_two
    @readings.lazy.each_cons(3).map(&:sum).then(&method(:count_increasing_slices))
  end

  private

  def count_increasing_slices(depths)
    depths.each_cons(2).count { |lhs, rhs| rhs > lhs }
  end
end
