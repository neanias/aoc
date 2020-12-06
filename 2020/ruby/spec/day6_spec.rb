# frozen_string_literal: true

require "day6"

RSpec.describe Day6 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_6) { described_class.new(problem_input) }

  describe "#part_1" do
    it "counts the number of yes answers" do
      expect(day_6.part_1).to eq(11)
    end
  end

  describe "#part_2" do
    it "counts the total number of yes answers" do
      expect(day_6.part_2).to eq(6)
    end
  end
end
