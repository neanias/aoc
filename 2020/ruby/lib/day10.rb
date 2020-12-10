# frozen_string_literal: true

class Day10
  def initialize(adapters_file)
    @adapters = File.readlines(adapters_file, chomp: true).map(&:to_i).sort
    @target_joltage = @adapters.max + 3
    @adapters.prepend(0).append(@target_joltage)
    @arrangements = 0
  end

  def part_1
    joltage = 0
    jolt_difference = Hash.new(0)
    @adapters.each do |adapter|
      old_joltage = joltage
      if joltage >= (adapter - 3) && joltage < adapter
        joltage = adapter
        jolt_difference[joltage - old_joltage] += 1
      end
    end

    jolt_difference[1] * jolt_difference[3]
  end

  def part_2
    @adapters.lazy.chunk_while { _2 - _1 != 3 }.map do |seq|
      if seq.size <= 2
        1
      else
        choose = seq.size - 2
        coefficient(choose, 2) + coefficient(choose, 1) + 1
      end
    end.reduce(:*)
  end

  private

  def coefficient(n, k)
    return 0 if n < k
    fact = ->(x) { (1..x).reduce(:*) || 1 }
    n_bang = fact.call(n)
    k_bang = fact.call(k)
    (n_bang / (k_bang * fact.call(n - k)))
  end
end
