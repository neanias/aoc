# typed: true
# frozen_string_literal: true

require "csv"
require "sorbet-runtime"

class Day4
  extend T::Sig

  sig { params(zones_file: String).void }
  def initialize(zones_file)
    @zones = T.let(
      CSV.readlines(zones_file).map do |(elf1, elf2)|
        elf1_range = Range.new(*elf1.split("-").map(&:to_i))
        elf2_range = Range.new(*elf2.split("-").map(&:to_i))
        [elf1_range, elf2_range]
      end,
      T::Array[[T::Range[Integer], T::Range[Integer]]]
    )
  end

  sig { returns(Integer) }
  def part_one
    @zones.count do |(elf1_range, elf2_range)|
      elf1_range.cover?(elf2_range) || elf2_range.cover?(elf1_range)
    end
  end

  sig { returns(Integer) }
  def part_two
    @zones.count do |(elf1, elf2)|
      !(elf1.to_a & elf2.to_a).empty?
    end
  end
end
