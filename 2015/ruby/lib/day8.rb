# frozen_string_literal: true

require "json"

class Day8
  def initialize(strings_file)
    @strings = File.readlines(strings_file, chomp: true)
  end

  def part_one
    @strings.sum(&:length) - @strings.sum { _1.undump.length }
  end

  def part_two
    @strings.sum { _1.dump.length } - @strings.sum(&:length)
  end
end
