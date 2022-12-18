# typed: true
# frozen_string_literal: true

require "json"
require "sorbet-runtime"

class Day13
  def initialize(packets_file)
    @packets = File.read(packets_file).split("\n\n").map do |block|
      block.lines(chomp: true).map { JSON.parse(_1) }
    end
  end

  def part_one
    @packets.each_with_index.sum do |(packets, idx)|
      next 0 unless correct_order?(*packets)

      idx + 1
    end
  end

  def part_two
    correct_orders = @packets.map { correct_order?(*_1) }
    swapped_packets = correct_orders.flat_map.with_index do |no_swap, idx|
      if no_swap
        @packets[idx]
      else
        rhs, lhs = @packets[idx]
        [lhs, rhs]
      end
    end
    sorted_packets = [*swapped_packets, [[2]], [[6]]].sort_by(&:flatten)
    two_index = sorted_packets.index([[2]]) + 1
    six_index = sorted_packets.index([[6]]) + 1

    two_index * six_index
  end

  private

  def correct_order?(left, right, indent = 0)
    # indent_spaces = " " * indent
    # puts "#{indent_spaces}- Compare #{left} vs #{right}"

    case [left, right]
    in [nil, *]
      # puts "#{indent_spaces}true"
      true
    in [_, nil]
      # puts "#{indent_spaces}false"
      false
    in [Integer, Integer]
      if left == right
        nil
      else
        # puts "#{indent_spaces}#{left < right}"
        left < right
      end
    in [Array, Array]
      if left.empty? && !right.empty?
        # puts "#{indent_spaces}true"
        true
      elsif !left.empty? && right.empty?
        # puts "#{indent_spaces}false"
        false
      else
        zip(left, right).flat_map { |(a, b)| correct_order?(a, b, indent + 2) }.find { !_1.nil? }
      end
    in [Integer, Array]
      correct_order?([left], right, indent + 2)
    in [Array, Integer]
      correct_order?(left, [right], indent + 2)
    end
  end

  def zip(l_arr, r_arr)
    return l_arr.zip(r_arr) if l_arr.size == r_arr.size

    length = [l_arr.size, r_arr.size].max
    (0...length).map do |idx|
      [l_arr[idx], r_arr[idx]]
    end
  end
end
