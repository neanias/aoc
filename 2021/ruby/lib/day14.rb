# frozen_string_literal: true

class Day14
  def initialize(polymer_file)
    @template, rule_strings = File.read(polymer_file, chomp: true).split("\n\n")
    @rules = rule_strings.split("\n").map do |rule|
      input, output = rule.split(" -> ")
      left_char, right_char = input.chars
      [input.chars, [[left_char, output], [output, right_char]]]
    end.to_h
  end

  def part_one
    chars = @template.chars.each_cons(2).tally
    chars.default = 0

    10.times do
      output_chars = Hash.new(0)

      @rules.each do |rule, (left_pair, right_pair)|
        if chars.key?(rule)
          output_chars[left_pair] += chars[rule]
          output_chars[right_pair] += chars[rule]
        end
      end

      chars = output_chars
    end

    counts = chars.each_with_object(Hash.new(0)) do |((lhs, _), count), hash|
      hash[lhs] += count
    end

    counts[@template[-1]] += 1
    counts.values.minmax.reverse.reduce(:-)
  end
end
