# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day2
  extend T::Sig

  Strategy = T.type_alias { T::Array[T::Array[String]] }

  MOVE_MAPPING = T.let(
    {
      "X" => 1,
      "Y" => 2,
      "Z" => 3
    }.freeze,
    T::Hash[String, Integer]
  )

  SCORE_MAPPING = T.let(
    {
      "X" => {
        "A" => 3,
        "B" => 0,
        "C" => 6
      },
      "Y" => {
        "A" => 6,
        "B" => 3,
        "C" => 0
      },
      "Z" => {
        "A" => 0,
        "B" => 6,
        "C" => 3
      }
    }.freeze,
    T::Hash[String, T::Hash[String, Integer]]
  )

  REQUIRED_MOVE = T.let(
    {
      "A" => {
        "X" => "Z",
        "Y" => "X",
        "Z" => "Y"
      },
      "B" => {
        "X" => "X",
        "Y" => "Y",
        "Z" => "Z"
      },
      "C" => {
        "X" => "Y",
        "Y" => "Z",
        "Z" => "X"
      }
    }.freeze,
    T::Hash[String, T::Hash[String, String]]
  )

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
    new_moves = T.cast(
      @strategy.map { |elf, you| [elf, T.must(REQUIRED_MOVE[T.must(elf)])[T.must(you)]] },
      T::Array[T::Array[String]]
    )
    move_scorer(new_moves)
  end

  private

  sig { params(strategy: Strategy).returns(Integer) }
  def move_scorer(strategy)
    score = strategy.sum { |_, move| MOVE_MAPPING[T.must(move)] }
    T.must(score) + T.cast(strategy.sum { |elf, you| T.must(SCORE_MAPPING[T.must(you)])[T.must(elf)] }, Integer)
  end
end
