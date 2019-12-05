# frozen_string_literal: true

class Intcode
  ADD = 1
  MUL = 2
  HLT = 99

  def initialize(memory)
    @memory = memory
    @pointer = 0
  end

  def run
    loop do
      break if halt?

      lhs, rhs, dest = parameters

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
    @pointer += 4
  end

  def execute(lhs, rhs)
    case opcode
    when ADD
      lhs + rhs
    when MUL
      lhs * rhs
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
