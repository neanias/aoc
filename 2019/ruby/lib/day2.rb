# frozen_string_literal: true

class Day2
  attr_accessor :programme

  GOAL = 19_690_720

  def process_input(file)
    @programme = File.read(file).chomp.split(",").map(&:to_i)
  end

  def part_1
    end_memory = execute(@programme)
    end_memory.join(",")
  end

  def part_2
    0.upto(100) do |i|
      0.upto(100) do |j|
        memory = @programme.dup
        memory[1] = i
        memory[2] = j
        end_memory = execute(memory)
        puts "noun: #{i}, verb: #{j}" if end_memory[0] == GOAL
        puts "100 * noun + verb: #{100 * i + j}" if end_memory[0] == GOAL
      end
    end
  end

  private

  def execute(memory)
    pointer = 0
    working_programme = memory.dup

    loop do
      operation = working_programme[pointer...pointer + 4]
      opcode, lhs, rhs, dest = operation

      if opcode == 1
        working_programme[dest] = working_programme[lhs] + working_programme[rhs]
      elsif opcode == 2
        working_programme[dest] = working_programme[lhs] * working_programme[rhs]
      elsif opcode == 99
        break
      else
        raise "Unknown opcode: #{opcode}"
      end

      pointer += 4
    end

    working_programme
  end
end
