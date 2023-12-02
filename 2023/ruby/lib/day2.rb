# frozen_string_literal: true

class Day2
  def initialize(games_file)
    @games = File.readlines(games_file, chomp: true).map do |line|
      _, handfuls = line.split(": ")
      handfuls.split(";").map do |handful|
        handful.split(",").each_with_object(Hash.new(1)) do |round, hash|
          num, colour = round.split(" ")
          hash[colour] = num.to_i
        end
      end
    end
  end

  def part_one
    @games.each_with_index.sum do |game, idx|
      if game.any? { _1["red"] > 12 || _1["green"] > 13 || _1["blue"] > 14 }
        0
      else
        idx + 1
      end
    end
  end

  def part_two
    @games.sum do |game|
      ["red", "blue", "green"].reduce(1) { |acc, colour| acc * game.max_by { _1[colour] }[colour] }
    end
  end
end
