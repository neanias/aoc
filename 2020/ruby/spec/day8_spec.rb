# frozen_string_literal: true

require "day8"

RSpec.describe Day8 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_8) { described_class.new(problem_input) }

  describe "#part_1" do
    it "stops after the first loop" do
      expect(day_8.part_1).to eq(5)
    end
  end

  describe "#part_2" do
    it "finds the answer for the swapped op" do
      expect(day_8.part_2).to eq(8)
    end
  end
end
