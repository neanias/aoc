# frozen_string_literal: true

require "set"

class Day8
  def initialize(digits_file)
    @digits = File.readlines(digits_file, chomp: true).map { _1.split(" | ").map(&:split) }
  end

  def part_one
    @digits.sum { |(_, outputs)| outputs.count { [2, 3, 4, 7].include?(_1.length) } }
  end

  def part_two
    @digits.sum do |(inputs, outputs)|
      mapped_outputs = output_map(inputs.map { _1.chars.to_set }.sort_by(&:length))
      outputs.map { mapped_outputs[_1.chars.to_set] }.join.to_i
    end
  end

  private

  # `inputs` array must be sorted by length
  def output_map(inputs)
    one = inputs[0]
    seven = inputs[1]
    four = inputs[2]
    eight = inputs[-1]

    zero_six_nine = inputs[6..8]
    six = zero_six_nine.find { !_1.superset?(one) }
    zero = zero_six_nine.difference([six]).find { !_1.superset?(four) }
    nine = zero_six_nine.difference([zero, six])[0]

    two_three_five = inputs[3..5]
    three = two_three_five.find { _1.superset?(one) }
    top_left_and_middle = four - one
    five = two_three_five.difference([three]).find { _1.superset?(top_left_and_middle) }
    two = two_three_five.difference([three, five])[0]

    {
      one => 1,
      two => 2,
      three => 3,
      four => 4,
      five => 5,
      six => 6,
      seven => 7,
      eight => 8,
      nine => 9,
      zero => 0,
    }
  end
end
