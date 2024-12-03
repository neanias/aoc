# frozen_string_literal: true

class Day3
  def initialize(program_file)
    @program = File.read(program_file)
  end

  def part_one
    @program.scan(/mul\((\d+),(\d+)\)/).sum { _1.to_i * _2.to_i }
  end

  def part_two
    exclusions = @program.to_enum(:scan, /don't\(\).*?do\(\)/m).map { Regexp.last_match }
    excluded_ranges = exclusions.map { _1.begin(0)..(_1.end(0) - 1) }

    multiplies = @program.to_enum(:scan, /mul\((\d+),(\d+)\)/).map { Regexp.last_match }
    multiplies.reject do |match|
      excluded_ranges.any? { |range| range.cover?(match.begin(0)) }
    end.sum do |md|
      md.captures.map(&:to_i).reduce(:*)
    end
  end
end
