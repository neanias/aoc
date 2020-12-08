# frozen_string_literal: true

require "set"

class Day8
  def initialize(programme)
    @programme = File.readlines(programme, chomp: true).map do |opcode|
      op, num = opcode.split
      [op, num.to_i]
    end
  end

  def part_1
    executor(@programme.reject { |op| op[0] == "nop" })
  end

  def part_2
    nop_jmp_lines = SortedSet.new
    @programme.each_with_index do |opcode, idx|
      next if opcode[0] == "acc"
      nop_jmp_lines.add(idx)
    end

    nop_jmp_lines.each do |index|
      next if @programme[index] == ["nop", 0]
      new_prog = swap_op(@programme, index)
      puts executor(new_prog)
    end
  end

  private

  def executor(programme = @programme)
    line_numbers = Set.new
    sum = 0
    line = 0

    loop do
      if line_numbers.include?(line)
        break
      elsif line == programme.size
        puts "FOUND #{sum}"
        break
      end
      op, num = programme[line]
      line_numbers.add(line)
      if op == "nop"
        line += 1
      elsif op == "acc"
        sum += num
        line += 1
      elsif op == "jmp"
        line += num
      end
    end

    sum
  end

  def swap_op(arr, index)
    new_arr = arr.dup
    current_op = arr[index]
    new_op = if current_op[0] == "nop"
               ["jmp", current_op[1]]
             elsif current_op[0] == "jmp"
               ["nop", current_op[1]]
             end
    new_arr[index] = new_op
    new_arr
  end
end
