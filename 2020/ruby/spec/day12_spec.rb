# frozen_string_literal: true

require "day12"

RSpec.describe Day12 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_12) { described_class.new(problem_input) }

  describe "#part_1" do
    it "calculates the Manhattan distance" do
      expect(day_12.part_1).to eq(25)
    end
  end

  describe "#part_2" do
    it "calculates the Manhattan distance" do
      expect(day_12.part_2).to eq(286)
    end
  end
end
