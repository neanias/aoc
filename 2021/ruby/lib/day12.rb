# frozen_string_literal: true

require "set"

class Day12
  def initialize(map)
    rules = File.readlines(map, chomp: true).map { _1.split("-") }
    @connexions = Hash.new { |h, k| h[k] = [] }
    rules.each { |(lhs, rhs)| @connexions[lhs] << rhs }
  end

  def part_one
    visited = Set.new
    starts = @connexions.select { |(lhs, _)| lhs == "start" }
  end

  private

  def big_cave?(location) = location >= "A" && location <= "Z"

  def small_cave?(location) = location >= "a" && location <= "z"
end
