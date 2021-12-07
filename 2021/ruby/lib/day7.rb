# frozen_string_literal: true

class Day7
  def initialize(crabs_file)
    @crabs = File.read(crabs_file, chomp: true).split(",").map(&:to_i)
  end

  def part_one
    median_position = median(@crabs).round
    @crabs.sum { (_1 - median_position).abs }
  end

  def part_two
    mean = mean(@crabs)
    high_mean, low_mean = [mean.ceil, mean.floor]
    [@crabs.sum { triangle((_1 - high_mean).abs) }, @crabs.sum { triangle((_1 - low_mean).abs) }].min
  end

  private

  def median(array)
    sorted = array.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end

  def mean(array)
    array.sum / array.size.to_f
  end

  def triangle(num)
    (num * (num + 1)) / 2
  end
end
