# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Day5
  extend T::Sig

  sig { params(cargo_file: String).void }
  def initialize(cargo_file)
    cargo_with_nums, instructions = File.read(cargo_file).split("\n\n").map { _1.split("\n") }
    cargo = T.must(cargo_with_nums).take_while { _1.strip.start_with?("[") }
    # returns [["[N]", "[Z]"], ["[D]", "[C]", "[M]"], ["[P]"]]
    @cargo_columns = T.let(
      cargo
        .map do |row|
          row.chars.each_slice(4).map { |slice| slice.join.strip }
        end
        .transpose
        .map { |col| col.reject { _1 == "" } },
      T::Array[T::Array[String]]
    )
    @instructions = T.must(instructions).map do |instruction|
      _, num, _, from, _, to = instruction.split
      [num.to_i, from.to_i, to.to_i]
    end
  end

  sig { returns(String) }
  def part_one
    sort_crates(reverse: true)
  end

  sig { returns(String) }
  def part_two
    sort_crates(reverse: false)
  end

  private

  sig { params(reverse: T::Boolean).returns(String) }
  def sort_crates(reverse:)
    cargo_columns = @cargo_columns.dup
    @instructions.each do |(num, from, to)|
      crates = T.must(cargo_columns[from - 1]).shift(num)
      cargo_columns[to - 1].unshift(*(reverse ? crates.reverse : crates))
    end

    cargo_columns.map { |col| T.must(col.first).delete("[]") }.join
  end
end
