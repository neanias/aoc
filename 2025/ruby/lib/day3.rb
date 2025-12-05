# frozen_string_literal: true

def day_3_part_1(batteries)
  batteries.each_line(chomp: true).map(&:to_i).sum do |battery|
    max_digit = battery.digits.max
    index = battery.digits.reverse.index(max_digit)
    next_max_digit = if index == battery.digits.size - 1
      battery.digits.reverse[0...index].max
    else
      battery.digits.reverse[index + 1..].max
    end

    (index == battery.digits.size - 1) ? "#{next_max_digit}#{max_digit}".to_i : "#{max_digit}#{next_max_digit}".to_i
  end
end
