# frozen_string_literal: true

require "day2"

RSpec.describe Day2 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_2) { described_class.new(problem_input) }

  describe "#part_1" do
    it "finds the right number of passwords" do
      expect(day_2.part_1).to eq(2)
    end
  end

  describe "#part_2" do
    it "finds the right number of passwords" do
      expect(day_2.part_2).to eq(1)
    end
  end
end
