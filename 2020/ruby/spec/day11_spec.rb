# frozen_string_literal: true

require "day11"

RSpec.describe Day11 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_11) { described_class.new(problem_input) }

  describe "#part_1" do
    it "calculate the number of occupied seats" do
      expect(day_11.part_1).to eq(37)
    end
  end

  describe "#part_2" do
    it "calculate the number of occupied seats" do
      expect(day_11.part_2).to eq(26)
    end
  end
end
