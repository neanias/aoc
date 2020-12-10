# frozen_string_literal: true

require "day10"

RSpec.describe Day10 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_10) { described_class.new(problem_input) }

  describe "#part_1" do
    it "calculates the difference in joltages" do
      expect(day_10.part_1).to eq(220)
    end
  end

  describe "#part_2" do
    it "calculates the number of arrangements" do
      expect(day_10.part_2).to eq(19208)
    end
  end
end
