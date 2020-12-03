# frozen_string_literal: true

require "day1"

RSpec.describe Day1 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_1) { described_class.new(problem_input) }

  describe "#part_1" do
    it "finds the two numbers" do
      expect(day_1.part_1).to eq(514579)
    end
  end

  describe "#part_2" do
    it "finds the three numbers for part 2" do
      expect(day_1.part_2).to eq(241861950)
    end
  end
end
