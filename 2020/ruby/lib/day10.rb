# frozen_string_literal: true

class Day10
  def initialize(adapters_file)
    @adapters = File.readlines(adapters_file, chomp: true).map(&:to_i).sort
    @target_joltage = @adapters.max + 3
    @arrangements = 0
  end

  def part_1
    joltage = 0
    jolt_difference = Hash.new(0)
    [*@adapters, @target_joltage].each do |adapter|
      break if joltage == @target_joltage
      old_joltage = joltage
      if joltage >= (adapter - 3) && joltage < adapter
        joltage = adapter
        jolt_difference[joltage - old_joltage] += 1
      end
    end

    jolt_difference[1] * jolt_difference[3]
  end

  def part_2
    @arrangements = 0
    joltages = [0, *@adapters].lazy.each_with_object({}) { |n, h| h[n] = [n + 1, n + 2, n + 3] }
    search(joltages, 0)
    @arrangements
  end

  private

  def search(joltages, key)
    return if key == (@target_joltage - 3)
    return unless joltages.key?(key)
    joltages[key].each do |number|
      if number == (@target_joltage - 3)
        @arrangements += 1
        return true
      end
      search(joltages, number)
    end
  end
end
