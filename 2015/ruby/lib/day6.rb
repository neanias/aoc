# frozen_string_literal: true

require "matrix"

class Day6
  Instruction = Data.define(:action, :start, :end)

  def initialize(instructions_file)
    @instructions = File.readlines(instructions_file, chomp: true).map do |inst|
      action = case inst
      when /turn on/
        :on
      when /turn off/
        :off
      else
        :toggle
      end
      ranges = inst.scan(/\d+,\d+/).map { |range| range.split(",").map(&:to_i) }
      Instruction.new(action, *ranges)
    end
  end

  def part_one
    lights = Matrix.build(1_000) { false }

    @instructions.each do |instruction|
      instruction.start[0].upto(instruction.end[0]) do |i|
        instruction.start[1].upto(instruction.end[1]) do |j|
          case instruction.action
          when :on
            lights[i, j] = true
          when :off
            lights[i, j] = false
          when :toggle
            lights[i, j] = !lights[i, j]
          end
        end
      end
    end

    lights.count(&:itself)
  end

  def part_two
    lights = Matrix.build(1_000) { 0 }

    @instructions.each do |instruction|
      instruction.start[0].upto(instruction.end[0]) do |i|
        instruction.start[1].upto(instruction.end[1]) do |j|
          case instruction.action
          when :on
            lights[i, j] += 1
          when :off
            lights[i, j] -= 1 if lights[i, j] > 0
          when :toggle
            lights[i, j] += 2
          end
        end
      end
    end

    lights.sum
  end
end
