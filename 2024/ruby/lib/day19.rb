# frozen_string_literal: true

class Day19
  def initialize(towels_file)
    available, patterns = File.read(towels_file, chomp: true).split("\n\n")
    @available = available.split(", ")
    @patterns = patterns.lines(chomp: true)
  end

  def part_one
    @patterns.count { _1.match?(/^#{Regexp.union(@available)}+$/) }
  end

  def part_two
    # Shrink problem space
    possible_patterns = @patterns.select { _1.match?(/^#{Regexp.union(@available)}+$/) }

    cache = {}
    possible_patterns.sum { count_combinations(_1, @available, cache) }
  end

  def count_combinations(pattern, towels, cache)
    return 1 if pattern.empty?

    cache[pattern] ||= towels.select { pattern.start_with?(_1) }
      .sum { count_combinations(pattern[_1.length..], towels, cache) }
  end
end
