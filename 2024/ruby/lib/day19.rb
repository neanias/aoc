# frozen_string_literal: true

class Day19
  def initialize(towels_file)
    available, patterns = File.read(towels_file, chomp: true).split("\n\n")
    @available = available.split(", ")
    @patterns = patterns.lines(chomp: true)
  end

  def part_one
    sorted_available = @available.sort { _2.length <=> _1.length }
    @patterns.count do |pattern|
      rolling_pattern = pattern.dup
      possible = false
      sorted_available.each do |towel|
        if pattern.include?(towel)
          rolling_pattern.gsub!(towel, "")
          if rolling_pattern.empty?
            possible = true
            break
          end
        end
      end
      possible
    end
  end
end
