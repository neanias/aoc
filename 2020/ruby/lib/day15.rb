# frozen_string_literal: true

class Day15
  def initialize(starting_numbers, target_turn = 2020)
    @starting_numbers = starting_numbers
    @target_turn = target_turn
  end

  def part_1
    turns = @starting_numbers.slice(..-2).map.with_index(1) { [_1, _2] }.to_h
    last_number = @starting_numbers.last
    turn_number = @starting_numbers.size + 1
    turn_number.upto(@target_turn) do |turn|
      current_number = turns.key?(last_number) ? turn - 1 - turns[last_number] : 0
      turns[last_number] = turn - 1
      last_number = current_number
    end

    last_number
  end

  def part_2
    turns = @starting_numbers.slice(..-2).map.with_index(1) { [_1, _2] }.to_h
    last_number = @starting_numbers.last
    turn_number = @starting_numbers.size + 1
    turn_number.upto(@target_turn) do |turn|
      current_number = turns.key?(last_number) ? turn - 1 - turns[last_number] : 0
      turns[last_number] = turn - 1
      last_number = current_number
    end

    last_number
  end
end
