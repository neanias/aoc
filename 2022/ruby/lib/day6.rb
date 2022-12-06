# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day6
  extend T::Sig

  def initialize(signal_file)
    @signal = T.let(File.read(signal_file).strip, String)
  end

  sig { returns(Integer) }
  def part_one
    find_marker(4)
  end

  sig { returns(Integer) }
  def part_two
    find_marker(14)
  end

  private

  sig { params(size: Integer).returns(Integer) }
  def find_marker(size)
    @signal.chars.each_cons(size).with_index do |substr, i|
      return i + size if substr.uniq.size == size
    end
  end
end
