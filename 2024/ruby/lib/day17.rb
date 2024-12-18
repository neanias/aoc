# frozen_string_literal: true

class Day17
  def initialize(computer_file)
    registers, program = File.read(computer_file, chomp: true).split("\n\n")
    @registers = registers.lines.each_with_object({}) do |line, hash|
      letter, num = line[9..].split(": ")
      hash[letter] = num.to_i
    end
    @program = program[8..].split(",").map(&:to_i)
  end

  def part_one
    output = []
    registers = @registers.dup
    ip = 0

    while ip < @program.length
      ip = process_opcode(ip, registers, @program[ip], @program[ip + 1], output)
    end

    output.join(",")
  end

  def part_two
    starting_register = 0
    loop do
      output = []
      registers = @registers.dup
      registers["A"] = starting_register
      ip = 0

      while ip < @program.length
        ip = process_opcode(ip, registers, @program[ip], @program[ip + 1], output)
      end

      break if output == @program
      starting_register += 1
    end

    starting_register
  end

  def process_opcode(ip, registers, opcode, operand, output, raise = false)
    case opcode
    when 0
      registers["A"] /= (2**process_combo(operand, registers))
    when 1
      registers["B"] = registers["B"] ^ operand
    when 2
      registers["B"] = process_combo(operand, registers) % 8
    when 3
      return operand if registers["A"] != 0
    when 4
      registers["B"] = registers["B"] ^ registers["C"]
    when 5
      output << process_combo(operand, registers) % 8
    when 6
      registers["B"] = registers["A"] / (2**process_combo(operand, registers))
    when 7
      registers["C"] = registers["A"] / (2**process_combo(operand, registers))
    end
    ip + 2
  end

  def process_combo(operand, registers)
    return operand if operand == 0 || operand < 4
    if operand == 4
      registers["A"]
    elsif operand == 5
      registers["B"]
    elsif operand == 6
      registers["C"]
    else
      raise "invalid operand"
    end
  end
end
