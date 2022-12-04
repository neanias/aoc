# typed: true
# frozen_string_literal: true

require "CSV"

class Day4
  def initialize(zones_file)
    @zones = CSV.readlines(zones_file).map do |(elf1, elf2)|
      elf1_range = Range.new(*elf1.split("-").map(&:to_i))
      elf2_range = Range.new(*elf2.split("-").map(&:to_i))
      [elf1_range, elf2_range]
    end
  end

  def part_one
    @zones.count do |(elf1_range, elf2_range)|
      elf1_range.cover?(elf2_range) || elf2_range.cover?(elf1_range)
    end
  end

  def part_two
    @zones.count do |(elf1, elf2)|
      elf1.to_a.intersect?(elf2.to_a)
    end
  end
end
