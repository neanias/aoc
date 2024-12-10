# frozen_string_literal: true

require "parallel"

class Day7
  Calibration = Data.define(:total, :operands)

  def initialize(bridge_file)
    @lines = File.readlines(bridge_file, chomp: true).map do |line|
      total, ops = line.split(": ")
      total = total.to_i
      ops = ops.split.map(&:to_i)
      Calibration.new(total, ops)
    end
  end

  def part_one
    @lines.select do |line|
      if line.operands.reduce(:*) == line.total || line.operands.sum == line.total
        next true
      end

      head, *tail = line.operands
      check_permutations(line.total, head, tail)
    end.sum(&:total)
  end

  def part_two
    @lines.select do |line|
      if line.operands.reduce(:*) == line.total ||
          line.operands.sum == line.total ||
          line.operands.map(&:to_s).join.to_i == line.total
        next true
      end

      head, *tail = line.operands
      check_permutations_concat(line.total, head, tail)
    end.sum(&:total)
  end

  def check_permutations(total, current, operands)
    head, *tail = operands
    return false if current > total

    plus = current + head
    times = current * head

    return true if (plus == total || times == total) && tail.empty?
    return false if tail.empty?
    check_permutations(total, plus, tail) || check_permutations(total, times, tail)
  end

  def check_permutations_concat(total, current, operands)
    head, *tail = operands
    return false if current > total

    plus = current + head
    times = current * head
    concat = "#{current}#{head}".to_i

    return true if (plus == total || times == total || concat == total) && tail.empty?
    return false if tail.empty?
    check_permutations_concat(total, plus, tail) || check_permutations_concat(total, times, tail) || check_permutations_concat(total, concat, tail)
  end
end
