# frozen_string_literal: true

class Day22
  def initialize(merchants_file)
    @merchant_numbers = File.readlines(merchants_file, chomp: true).map(&:to_i)
  end

  def part_one
    numbers = @merchant_numbers.dup
    2000.times do
      numbers.length.times do |idx|
        secret = numbers[idx]
        new = secret * 64
        secret = (secret ^ new) % 16777216
        new = secret / 32
        secret = (secret ^ new) % 16777216
        new = secret * 2048
        numbers[idx] = (secret ^ new) % 16777216
      end
    end
    numbers.sum
  end

  def part_two
    numbers = @merchant_numbers.dup
    digits = Array.new(numbers.size) { [numbers[_1].digits[0]] }
    2000.times do
      numbers.length.times do |idx|
        secret = numbers[idx]
        new = secret * 64
        secret = (secret ^ new) % 16777216
        new = secret / 32
        secret = (secret ^ new) % 16777216
        new = secret * 2048
        numbers[idx] = (secret ^ new) % 16777216
        digits[idx].push(numbers[idx].digits[0])
      end
    end
    windows = digits.map { |arr| arr.each_cons(2).flat_map { _2 - _1 }.each_cons(4).to_a }
    window = windows[0].max_by do |slice|
    end
  end
end
