# frozen_string_literal: true

def day_2_part_1(id_ranges)
  ranges = id_ranges.split(",")
  ranges.sum do |range|
    first, last = range.split("-")
    Range.new(first.to_i, last.to_i).select do |id|
      next false if id.digits.size.odd?
      half = id.digits.size / 2
      id.digits[0...half] == id.digits[half..]
    end.sum
  end
end

def day_2_part_2(id_ranges)
  ranges = id_ranges.split(",")
  ranges.sum do |range|
    first, last = range.split("-")
    Range.new(first.to_i, last.to_i).select { |id| id.to_s.match?(/^(\d+)\1+$/) }.sum
  end
end

def day_2_part_2_select(id_ranges)
  ranges = id_ranges.split(",")
  ranges.map do |range|
    first, last = range.split("-")
    Range.new(first.to_i, last.to_i).select { |id| id.to_s.match?(/^(\d+)\1+$/) }
  end
end
