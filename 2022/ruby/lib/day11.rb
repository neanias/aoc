# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Monkey
  extend T::Sig

  attr_reader :inspected
  attr_accessor :items, :operation, :test_divisor, :true_dest, :false_dest

  Operation = T.type_alias { T.proc.params(arg0: Integer).returns(Integer) }

  sig { params(number: Integer).void }
  def initialize(number:)
    @number = number
    @items = []
    @operation = T.let(->(x) { x }, Operation)
    @test_divisor = 1
    @true_dest = 0
    @false_dest = 0
    @inspected = 0
  end

  sig { params(blurb: String).returns(T.attached_class) }
  def self.from_blurb(blurb)
    lines = blurb.split("\n")
    monkey = new(number: T.must(lines[0]).split[1].to_i)

    monkey.items = T.must(T.must(lines[1]).split(": ").last).split(", ").map(&:to_i)
    monkey.operation = operation_to_lambda(T.must(T.must(T.must(lines[2]).split(": ")[1]).split(" = ")[1]))
    monkey.test_divisor = T.must(lines[3]).split.last.to_i
    monkey.true_dest = T.must(lines[4]).split.last.to_i
    monkey.false_dest = T.must(lines[5]).split.last.to_i

    monkey
  end

  sig { params(operation: String).returns(Operation) }
  def self.operation_to_lambda(operation)
    lhs, sign, rhs = operation.split
    operator = sign == "+" ? :+ : :*
    # both old
    if lhs == rhs
      -> (old) { old.send(operator, old) }
    else
      -> (old) { old.send(operator, rhs.to_i) }
    end
  end

  sig { params(part_one: T::Boolean, divisor: Integer).returns(T::Array[[Integer, Integer]]) }
  def take_round(part_one:, divisor:)
    item_throws = @items.map do |item|
      @inspected += 1

      item = operation.call(item)

      if part_one
        item /= 3
      else
        item %= divisor
      end

      [(item % test_divisor).zero? ? true_dest : false_dest, item]
    end

    items.clear
    item_throws
  end

  def give_item(item) = items.push(item)
end

class Day11
  extend T::Sig

  sig { params(monkeys_file: String).void }
  def initialize(monkeys_file)
    @monkeys = T.let(File.read(monkeys_file).split("\n\n").map { Monkey.from_blurb(_1) }, T::Array[Monkey])
  end

  sig { returns(Integer) }
  def part_one = run_rounds(20, part_one: true)

  sig { returns(Integer) }
  def part_two = run_rounds(10_000, part_one: false)

  sig { params(num_rounds: Integer, part_one: T::Boolean).returns(Integer) }
  def run_rounds(num_rounds, part_one:)
    # Only needed for part 2
    gross_divisors = @monkeys.reduce(1) { |prod, monkey| prod * monkey.test_divisor }

    num_rounds.times do
      @monkeys.length.times do |i|
        monkey = T.must(@monkeys[i])
        items = monkey.take_round(part_one: part_one, divisor: gross_divisors)
        items.each { |(dest, item)| T.must(@monkeys[dest]).give_item(item) }
      end
    end

    @monkeys.map(&:inspected).max(2).reduce(:*)
  end
end
