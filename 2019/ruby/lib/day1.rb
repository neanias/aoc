# frozen_string_literal: true

class Day1
  def process_input(file)
    @masses = File.readlines(file, chomp: true).map(&:to_i)
  end

  def part_1
    @masses.sum { |mass| calculate_fuel_needed(mass) }
  end

  def part_2
    @masses.sum do |mass|
      main_fuel = calculate_fuel_needed(mass)
      self_fuel = main_fuel
      until self_fuel.negative?
        self_fuel = calculate_fuel_needed(self_fuel)
        main_fuel += self_fuel if self_fuel.positive?
      end

      main_fuel
    end
  end

  private

  def calculate_fuel_needed(mass)
    (mass / 3).floor - 2
  end
end
