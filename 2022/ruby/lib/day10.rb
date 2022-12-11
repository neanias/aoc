# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day10
  extend T::Sig

  sig { params(programme_file: String).void }
  def initialize(programme_file)
    programme = File.readlines(programme_file, chomp: true).map do |line|
      command, num = line.split
      [command, num.to_i]
    end

    @changes = T.let(programme.flat_map { |(command, arg)| command == "noop" ? [0] : [0, arg] }, T::Array[Integer])
  end

  sig { returns(Integer) }
  def part_one
    x = 1
    cycle = 1
    strength = 0

    @changes.each do |diff|
      strength += (cycle * x) if cycle % 40 == 20 && cycle <= 220

      x += diff

      cycle += 1
    end

    strength
  end

  sig { returns(String) }
  def part_two
    sprite_pos = [1, 2, 3]
    cursor_pos = 1
    output = StringIO.new

    @changes.each do |diff|
      if cursor_pos > 40
        output.puts
        cursor_pos = 1
      end

      output.print(sprite_pos.include?(cursor_pos) ? "#" : ".")

      sprite_pos.map! { _1 + diff }
      cursor_pos += 1
    end

    output.puts

    output.string
  end
end
