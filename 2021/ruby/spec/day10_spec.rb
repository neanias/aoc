# frozen_string_literal: true

require "day10"
require "spec_helper"

describe Day10 do
  subject(:day_ten) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the total syntax error score" do
      expect(day_ten.part_one).to eq(26_397)
    end
  end

  describe "#part_two" do
    it "finds the middle score" do
      expect(day_ten.part_two).to eq(288_957)
    end
  end
end
