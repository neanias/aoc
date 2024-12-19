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
  end
end
