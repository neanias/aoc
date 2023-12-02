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
        next 0
      end

      idx + 1
    end
  end

  def part_two
    @games.sum do |game|
      blues = game.max_by { _1["blue"] }["blue"]
      reds = game.max_by { _1["red"] }["red"]
      greens = game.max_by { _1["green"] }["green"]
      blues * reds * greens
    end
  end
end
