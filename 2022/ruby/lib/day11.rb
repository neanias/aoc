# typed: true
# frozen_string_literal: true

class Monkey
  attr_reader :inspected
  attr_accessor :items, :operation, :test_divisor, :true_dest, :false_dest

  def initialize(number:)
    @number = number
    @items = []
    @operation = -> {}
    @test_divisor = 1
    @true_dest = 0
    @false_dest = 0
    @inspected = 0
  end

  def self.from_blurb(blurb)
    lines = blurb.split("\n")
    monkey = new(number: lines[0].split[1].to_i)

    monkey.items = lines[1].split(": ").last.split(", ").map(&:to_i)
    monkey.operation = operation_to_lambda(lines[2].split(": ")[1].split(" = ")[1])
    monkey.test_divisor = lines[3].split.last.to_i
    monkey.true_dest = lines[4].split.last.to_i
    monkey.false_dest = lines[5].split.last.to_i

    monkey
  end

  def self.operation_to_lambda(operation)
    lhs, sign, rhs = operation.split
    operator = sign == "+" ? :+ : :*
    if lhs == rhs # both old
      ->(old) { old.send(operator, old) }
    else
      ->(old) { old.send(operator, rhs.to_i) }
    end
  end

  def take_round(part_one:, divisor:)
    item_throws = @items.map do |item|
      @inspected += 1

      item = operation.call(item)

      if part_one
        item /= 3
      else
        item %= divisor
      end

      if (item % test_divisor).zero?
        [true_dest, item]
      else
        [false_dest, item]
      end
    end

    items.clear
    item_throws
  end

  def give_item(item) = items.push(item)
end

class Day11
  def initialize(monkeys_file)
    @monkeys = File.read(monkeys_file).split("\n\n").map { Monkey.from_blurb(_1) }
  end

  def part_one = run_rounds(20, part_one: true)

  def part_two = run_rounds(10_000, part_one: false)

  def run_rounds(num_rounds, part_one:)
    # Only needed for part 2
    gross_divisors = @monkeys.reduce(1) { |prod, monkey| prod * monkey.test_divisor }

    num_rounds.times do
      @monkeys.length.times do |i|
        monkey = @monkeys[i]
        items = monkey.take_round(part_one: part_one, divisor: gross_divisors)
        items.each { |(dest, item)| @monkeys[dest].give_item(item) }
      end
    end

    @monkeys.map(&:inspected).max(2).reduce(:*)
  end
end
