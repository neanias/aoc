# frozen_string_literal: true

class Day5
  def initialize(strings_file)
    @strings = File.readlines(strings_file, chomp: true)
  end

  def part_one
    disallowed_strings = %w[ab cd pq xy].freeze
    vowels = %w[a e i o u].freeze

    @strings.count do |string|
      has_bad_chars = disallowed_strings.any? { string.include?(_1) }

      chars = string.chars

      letters = chars.tally
      three_vowels = letters.slice(*vowels).values.sum >= 3

      doubles = chars.each_cons(2).any? { |(a, b)| a == b }

      three_vowels && doubles && !has_bad_chars
    end
  end

  def part_two
    @strings.count do |string|
      triples = string.chars.each_cons(3).any? { |(a, _, c)| a == c }

      has_repeats = string.match?(/(..).*\1/)

      triples && has_repeats
    end
  end
end
