# frozen_string_literal: true

class Day10
  PAIRS = {
    "[" => "]",
    "(" => ")",
    "{" => "}",
    "<" => ">",
  }.freeze
  OPENING_BRACKETS = PAIRS.keys.freeze
  CLOSING_BRACKETS = PAIRS.values.freeze

  def initialize(chunks_file)
    @chunks = File.readlines(chunks_file, chomp: true).map(&:chars)
  end

  def part_one
    scores = {
      ")" => 3,
      "]" => 57,
      "}" => 1197,
      ">" => 25_137,
    }.freeze

    found_sum = 0

    @chunks.each do |line|
      scope = []
      line.each do |bracket|
        if OPENING_BRACKETS.include?(bracket)
          scope.push(bracket)
        elsif CLOSING_BRACKETS.include?(bracket)
          current = scope.pop
          if PAIRS[current] != bracket
            found_sum += scores[bracket]
            break
          end
        end
      end
    end

    found_sum
  end

  def part_two
    scores = {
      ")" => 1,
      "]" => 2,
      "}" => 3,
      ">" => 4,
    }.freeze

    incomplete = @chunks.reject do |line|
      scope = []
      line.any? do |bracket|
        if OPENING_BRACKETS.include?(bracket)
          scope.push(bracket)
          false
        elsif CLOSING_BRACKETS.include?(bracket)
          current = scope.pop
          PAIRS[current] != bracket
        end
      end
    end

    scores = incomplete.map do |line|
      scope = []
      line.each { OPENING_BRACKETS.include?(_1) ? scope.push(_1) : scope.pop }
      scope.map { PAIRS[_1] }.reverse.reduce(0) do |acc, br|
        (5 * acc) + scores[br]
      end
    end.sort

    scores[scores.size / 2]
  end
end
