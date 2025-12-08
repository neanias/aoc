# frozen_string_literal: true

class Day25
  def initialize(schematics_file)
    schematics = File.read(schematics_file).split("\n\n").map { _1.lines(chomp: true).map(&:chars) }
    @locks = schematics.select { _1[0].all?("#") && _1[-1].all?(".") }
    @keys = schematics.select { _1[0].all?(".") && _1[-1].all?("#") }
  end

  def part_one
    @locks.sum do |lock|
      @keys.count do |key|
        lock.transpose.map { _1.count("#") }.zip(key.transpose.map { _1.count("#") }).all? { _1 + _2 <= 7 }
      end
    end
  end
end
