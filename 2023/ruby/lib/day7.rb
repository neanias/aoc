# frozen_string_literal: true

class Day7
  def initialize(hands_file)
    @hands = File.readlines(hands_file, chomp: true).map do |hand|
      cards, bid = hand.split(" ")
      bid = bid.to_i
      [cards, bid]
    end
  end

  def part_one
    card_size = {
      "T" => 10,
      "J" => 11,
      "Q" => 12,
      "K" => 13,
      "A" => 14
    }
    card_size.default_proc = ->(h, k) { h[k] = k.to_i }

    # types = @hands.map { _1[0].chars.tally }
    sorted_hands = @hands.sort do |lhs, rhs|
      l_cards, _ = lhs
      r_cards, _ = rhs
      l_type = l_cards.chars.tally
      r_type = r_cards.chars.tally
      if l_type.values.max > r_type.values.max
        next 1
      elsif r_type.values.max > l_type.values.max
        next -1
      end


    end

    sorted_hands.each_with_index.sum { |(_, bid), idx| bid * idx + 1 }
  end
end
