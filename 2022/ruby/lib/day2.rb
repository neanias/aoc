# frozen_string_literal: true

class Day2
  MOVE_MAPPING = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
  }.freeze

  SCORE_MAPPING = {
    "X" => {
      "A" => 3,
      "B" => 0,
      "C" => 6,
    },
    "Y" => {
      "A" => 6,
      "B" => 3,
      "C" => 0,
    },
    "Z" => {
      "A" => 0,
      "B" => 6,
      "C" => 3,
    }
  }.freeze

  REQUIRED_MOVE = {
    "A" => {
      "X" => "Z",
      "Y" => "X",
      "Z" => "Y",
    },
    "B" => {
      "X" => "X",
      "Y" => "Y",
      "Z" => "Z",
    },
    "C" => {
      "X" => "Y",
      "Y" => "Z",
      "Z" => "X",
    }
  }.freeze

  def initialize(strategy_file)
    @strategy = File.readlines(strategy_file).map(&:split)
  end

  def part_one
    score = @strategy.sum { MOVE_MAPPING[_2] }
    score + @strategy.sum { SCORE_MAPPING[_2][_1] }
  end

  def part_two
    new_moves = @strategy.map { [_1, REQUIRED_MOVE[_1][_2]] }
    score = new_moves.sum { MOVE_MAPPING[_2] }
    score + new_moves.sum { SCORE_MAPPING[_2][_1] }
  end
end
