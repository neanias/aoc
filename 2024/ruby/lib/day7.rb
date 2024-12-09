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

      operands = line.operands
      operators = [:+, :*] * (operands.length - 1)
      op_permutations = operators.permutation(operands.length - 1)
      op_permutations.any? { |permutation| calculate(operands.zip(permutation).flatten[..-2]) == line.total }

      # valid_lines << line if permutations.any? { calculate(_1) == line.total }
    end.sum(&:total)

    # valid_lines.sum(&:total)
  end

  def part_one_parallel
    results = Parallel.map(@lines, in_processes: 4) { run_loop(_1) }

    results.reject { _1.nil? }.sum(&:total)
  end

  def run_loop(line)
    puts "Processing line: #{line}"
    if line.operands.reduce(:*) == line.total || line.operands.sum == line.total
      puts "#{line} is good with product or sum"
      return line
    elsif line.operands.reduce(:*) < line.total
      puts "#{line} product is smaller than total"
      return nil
    end

    operands = line.operands
    operators = [:+, :*] * (operands.length - 1)
    op_permutations = operators.permutation(operands.length - 1)
    if op_permutations.any? { |permutation| calculate(operands.zip(permutation).flatten[..-2]) == line.total }
      puts "#{line} is good"
      return line
    end

    # if permutations.any? { calculate(_1) == line.total }
    #   puts "#{line} is good"
    #   return line
    # end
    nil
  end

  def calculate(arr)
    return arr[0] if arr.length == 1

    arr => [l, op, r, *rest]
    new_l = l.send(op, r)
    calculate([new_l, *rest])
  end
end

day7 = Day7.new("inputs/day7.txt")
day7.part_one_parallel
