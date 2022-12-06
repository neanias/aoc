# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day6
  extend T::Sig

  def initialize(signal_file)
    @signal = File.read(signal_file).strip
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
    count = 0
    @signal.chars.each_cons(size).each do |substr|
      if substr.uniq.size == size
        count += size
        break
      end
      count += 1
    end

    count
  end
end
