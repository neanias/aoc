# frozen_string_literal: true

class Intcode
  ADD = 1
  MUL = 2
  IN  = 3
  OUT = 4
  HLT = 99

  def initialize(memory)
    @memory = memory
    @pointer = 0
    @modes = %i[position position position]
    @dest = 0
    @instruction = 0
  end

  def run
    loop do
      break if halt?

      lhs, rhs, @dest = parameters

      result = execute(load(lhs), load(rhs))
      store(dest, result)

      advance
    end

    @memory
  end

  private

  def opcode
    @memory[@pointer]
  end

  def parameters
    @memory[@pointer + 1, 3]
  end

  def advance
    @pointer += case @instruction
    when 1..2
      4
    when 3..4
      2
    else
      0
    end
  end

  def execute(lhs, rhs = 0)
    case opcode
    when ADD
      lhs + rhs
    when MUL
      lhs * rhs
    when IN
      print("input: ")
      gets.chomp.to_i
    when OUT
      puts lhs
    else
      raise "Unknown opcode: #{opcode}"
    end
  end

  def halt?
    opcode == HLT
  end

  def load(address)
    @memory[address]
  end

  def store(address, value)
    @memory[address] = value
  end
end
