# frozen_string_literal: true

require "day4"
require "spec_helper"

describe Day4 do
  subject(:day_four) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "finds the score of the winning board" do
      expect(day_four.part_one).to eq(4512)
    end
  end

  describe "#part_two" do
    it "finds the score of the last winning board" do
      expect(day_four.part_two).to eq(1924)
    end
  end
end
