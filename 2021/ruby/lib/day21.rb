# frozen_string_literal: true

class Day21
  def initialize(starting_positions_file)
    @player_1_start, @player_2_start = File.readlines(starting_positions_file, chomp: true).map do
      _1.split(": ")[-1].to_i
    end
  end

  def part_one
    player_1_score = 0
    player_1_pos = @player_1_start
    player_2_score = 0
    player_2_pos = @player_2_start
    # die = (1..100).to_a
    dice_rolls = 0
    dice_indices = [0, 1, 2]

    player_1_turn = true

    while player_1_score < 1000 && player_2_score < 1000
      dist = dice_indices.sum(&:succ)
      dice_rolls += 3
      dice_indices.map! { (_1 + 3) % 100 }

      if player_1_turn
        player_1_pos = (((player_1_pos + dist) - 1) % 10) + 1
        player_1_score += player_1_pos
      else
        player_2_pos = (((player_2_pos + dist) - 1) % 10) + 1
        player_2_score += player_2_pos
      end

      player_1_turn = !player_1_turn
    end

    loser = [player_1_score, player_2_score].min
    loser * dice_rolls
  end
end
