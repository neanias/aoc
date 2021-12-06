# frozen_string_literal: true

class Day6
  def initialize(fish_file)
    @fish_ages = File.read(fish_file, chomp: true).split(",").map(&:to_i)
  end

  def part_one
    fish = Hash.new(0).merge(@fish_ages.tally)

    80.times do
      eights = fish[0]
      (1..8).each { |age| fish[age - 1] = fish[age] }
      fish[6] += eights
      fish[8] = eights
    end

    fish.values.sum
  end

  def part_two
    fish = Hash.new(0).merge(@fish_ages.tally)

    256.times do
      eights = fish[0]
      (1..8).each { |age| fish[age - 1] = fish[age] }
      fish[6] += eights
      fish[8] = eights
    end

    fish.values.sum
  end
end
