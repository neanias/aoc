# typed: true
# frozen_string_literal: true

require "matrix"
require "set"
require "sorbet-runtime"

class Day9
  extend T::Sig

  def initialize(movements_file)
    movements = T.cast(
      File.readlines(movements_file, chomp: true).map do |line|
        direction, steps = line.split
        d_vec = case direction
        when "U"
          Vector[0, 1]
        when "D"
          Vector[0, -1]
        when "R"
          Vector[1, 0]
        when "L"
          Vector[-1, 0]
        end

        [d_vec, steps.to_i]
      end,
      T::Array[[String, Integer]]
    )
    @movements = T.let(movements, T::Array[[String, Integer]])
  end

  def part_one
    calculate_path([Vector[0, 0], Vector[0, 0]])
  end

  def part_two
    calculate_path(Array.new(10, Vector[0, 0]))
  end

  private

  def calculate_path(knots)
    t_history = Set.new([Vector[0, 0]])

    @movements.each do |(direction, steps)|
      steps.times do
        knots[0] += direction

        range = 0...knots.size
        range.each_cons(2) do |(left_idx, right_idx)|
          left = knots[left_idx]
          right = knots[right_idx]
          next if touching?(left, right)

          diff = move_to(left, right)
          knots[right_idx] += diff
        end

        t_pos = knots[-1]
        t_history.add(t_pos)
      end
    end

    t_history.size
  end

  sig { params(h_pos: Vector, t_pos: Vector).returns(T::Boolean) }
  def touching?(h_pos, t_pos)
    (h_pos - t_pos).magnitude.floor <= 1
  end

  sig { params(h_pos: Vector, t_pos: Vector).returns(Vector) }
  def move_to(h_pos, t_pos)
    (h_pos - t_pos).map { |x| x.zero? ? 0 : x / x.abs }
  end
end
