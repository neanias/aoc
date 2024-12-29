# frozen_string_literal: true

class Day24
  OPS = {"AND" => :&, "OR" => :|, "XOR" => :^}.freeze
  Wire = Struct.new(:arg1, :arg2, :op, :out, :completed) do
    def connect(input)
      input[out] = input[arg1].send(OPS[op], input[arg2])
      self.completed = true
    end
  end

  def initialize(schematic)
    wires, connections = File.read(schematic).split("\n\n")
    @wires = wires.lines(chomp: true).each_with_object({}) do |wire, h|
      name, val = wire.split(": ")
      h[name] = val.to_i
    end
    @connections = connections.lines(chomp: true).map do |expr|
      expr.split => [arg1, op, arg2, _, out]
      Wire.new(arg1, arg2, op, out)
    end
  end

  def part_one
    connections = @connections.map { _1.dup }
    wires = @wires.dup
    until connections.all?(&:completed)
      possible_connections = connections.select { wires.key?(_1.arg1) && wires.key?(_1.arg2) && !_1.completed }
      possible_connections.each { _1.connect(wires) }
    end

    wires.select { _1.start_with?("z") }.sort { _2[0] <=> _1[0] }.map(&:last).join.to_i(2)
  end
end
