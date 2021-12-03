# frozen_string_literal: true

require "day3"
require "spec_helper"

describe Day3 do
  subject(:day_three) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the power consumption" do
      expect(day_three.part_one).to eq(198)
    end
  end

  describe "#part_two" do
    it "calculates the life support rating" do
      expect(day_three.part_two).to eq(230)
    end
  end
end
