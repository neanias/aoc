# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day1
  extend T::Sig

  sig { params(input_file: String).void }
  def initialize(input_file)
    @calories = T.let(
      File.read(input_file).split("\n\n").map { _1.split.map(&:to_i) }.map(&:sum),
      T::Array[Integer]
    )
  end

  sig { returns(Integer) }
  def part_one
    T.must(@calories.max)
  end

  sig { returns(Integer) }
  def part_two
    @calories.max(3).sum
  end
end
