# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day3
  extend T::Sig

  sig { params(item_file: String).void }
  def initialize(item_file)
    @rucksacks = T.let(File.readlines(item_file, chomp: true), T::Array[String])
  end

  sig { returns(Integer) }
  def part_one
    @rucksacks.sum do |rucksack|
      contents = rucksack.chars
      size = contents.length
      lhs = T.must(contents.take(size/2))
      rhs = T.must(contents.drop(size/2))
      T.must(lhs.intersection(rhs).map { calculate_priority(_1) }.first)
    end
  end

  sig { returns(Integer) }
  def part_two
    @rucksacks.each_slice(3).sum do |group|
      chars = group.map(&:chars)
      T.must(
        T.cast(
          (chars[0] & T.must(chars[1]) & T.must(chars[2])), T::Array[String]
        ).map { calculate_priority(_1) }.first
      )
    end
  end

  private

  sig { params(char: String).returns(Integer) }
  def calculate_priority(char)
    if char in ("a".."z")
      (char.ord % 97) + 1
    else
      (char.ord % 65) + 27
    end
  end
end
