# frozen_string_literal: true

require "matrix"

class Day4
  def initialize(bingo_file)
    numbers, *cards = File.read(bingo_file).split("\n\n")
    @numbers = numbers.split(",").map(&:to_i)
    @cards = cards.map do |card|
      Matrix[
        *card.split("\n").map { |row| row.split.map(&:to_i) }
      ]
    end
  end

  def part_one
    winner, number = @numbers.each do |number|
      @cards.each_with_index do |card, card_index|
        idx = card.find_index(number)
        @cards[card_index][*idx] = nil if idx
      end

      winning_card = @cards.find do |card|
        card.row_vectors.any? { _1.all?(&:nil?) } || card.column_vectors.any? { _1.all?(&:nil?) }
      end

      break [winning_card, number] if winning_card
    end

    winner.reject(&:nil?).sum * number
  end

  def part_two
    winner, number = @numbers.each do |number|
      @cards.each_with_index do |card, card_index|
        idx = card.find_index(number)
        @cards[card_index][*idx] = nil if idx
      end

      cards_before = @cards.dup
      @cards.delete_if do |card|
        card.row_vectors.any? { _1.all?(&:nil?) } || card.column_vectors.any? { _1.all?(&:nil?) }
      end

      break [cards_before[0], number] if cards_before != @cards && @cards.length == 0
    end

    winner.reject(&:nil?).sum * number
  end
end
