# frozen_string_literal: true

require "day9"
require "spec_helper"

describe Day9 do
  subject(:day_nine) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "determines the risk level of the low points" do
      expect(day_nine.part_one).to eq(15)
    end
  end

  describe "#part_two" do
    it "finds the size of the largest basins" do
      expect(day_nine.part_two).to eq(1134)
    end
  end
end
