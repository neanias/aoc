# frozen_string_literal: true

require "day9"

RSpec.describe Day9 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  let(:preamble_size) { 5 }
  let(:goal) { 127 }
  subject(:day_9) { described_class.new(problem_input, preamble_size) }

  describe "#part_1" do
    it "finds the odd number out" do
      expect(day_9.part_1).to eq(goal)
    end
  end

  describe "#part_2" do
    it "finds the sum of the highest and lowest number" do
      expect(day_9.part_2(goal)).to eq(62)
    end
  end
end
