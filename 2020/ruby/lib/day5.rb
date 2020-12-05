# frozen_string_literal: true

class Day5
  def initialize(boarding_passes)
    @boarding_passes = File.read(boarding_passes).split("\n")
  end

  def part_1
    @boarding_passes.map { |pass| calculate_seat_id(pass) }.max
  end

  def part_2
    seat_ids = @boarding_passes.map { |pass| calculate_seat_id(pass) }.sort
    (seat_ids[0]..seat_ids[-1]).to_a.difference(seat_ids)[0]
  end

  private

  def calculate_seat_id(pass)
    rows = find_final_pair(pass[0...6], front: "F", back: "B", max: 127)
    row = pass[6] == "F" ? rows[0] : rows[1]
    seats = find_final_pair(pass[7..8], front: "L", back: "R", max: 7)
    seat = pass[-1] == "L" ? seats[0] : seats[1]
    row * 8 + seat
  end

  def find_final_pair(directions, front:, back:, max:)
    rows = [0, max]
    directions.each_char do |direction|
      offset = (rows[0]..rows[1]).size / 2
      if direction == front
        rows[1] -= offset
      elsif direction == back
        rows[0] += offset
      end
    end
    rows
  end
end
