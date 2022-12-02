# frozen_string_literal: true
# typed: true

require "sorbet-runtime"

class Day2
  extend T::Sig

  Strategy = T.type_alias { T::Array[T::Array[String]] }

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

  sig { params(strategy_file: String).void }
  def initialize(strategy_file)
    @strategy = T.let(File.readlines(strategy_file).map(&:split), Strategy)
  end

  sig { returns(Integer) }
  def part_one
    move_scorer(@strategy)
  end

  sig { returns(Integer) }
  def part_two
    new_moves = @strategy.map { |elf, you| [elf, REQUIRED_MOVE[elf][you]] }
    move_scorer(new_moves)
  end

  private

  sig { params(strategy: Strategy).returns(Integer) }
  def move_scorer(strategy)
    score = strategy.sum { |_, move| MOVE_MAPPING[move] }
    score + strategy.sum { |elf, you| SCORE_MAPPING[you][elf] }
  end
end
