# typed: true
# frozen_string_literal: true

require "json"

class Day13
  def initialize(packets_file)
    @packets = File.read(packets_file).split("\n\n").map do |block|
      block.lines(chomp: true).map { JSON.parse(_1) }
    end
  end

  def part_one
    @packets.each_with_index.sum do |((left, right), idx)|
      next 0 unless correct_order?(left, right)

      idx + 1
    end
  end

  def part_two
    correct_orders = @packets.map { |(left, right)| correct_order?(left, right) }
    swapped_packets = correct_orders.flat_map.with_index do |no_swap, idx|
      if no_swap
        @packets[idx]
      else
        rhs, lhs = @packets[idx]
        [lhs, rhs]
      end
    end

    swapped_packets.concat([[[2]]], [[[6]]])
    sorted_packets = swapped_packets.sort { |a, b| correct_order?(a, b) ? -1 : 1 }
    two_index = sorted_packets.index([[2]]) + 1
    six_index = sorted_packets.index([[6]]) + 1

    two_index * six_index
  end

  private

  def correct_order?(left, right)
    case [left, right]
    in [nil, *]
      true
    in [_, nil]
      false
    in [Integer, Integer]
      if left == right
        nil
      else
        left < right
      end
    in [Array, Array]
      if left.empty? && !right.empty?
        true
      elsif !left.empty? && right.empty?
        false
      else
        zip(left, right).flat_map { |(a, b)| correct_order?(a, b) }.find { !_1.nil? }
      end
    in [Integer, Array]
      correct_order?([left], right)
    in [Array, Integer]
      correct_order?(left, [right])
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
