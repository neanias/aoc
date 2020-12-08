# frozen_string_literal: true

require "day7"

RSpec.describe Day7 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_7) { described_class.new(problem_input) }

  describe "#part_1" do
    it "counts the number of bags that contain shiny gold" do
      expect(day_7.part_1).to eq(4)
    end
  end

  describe "#part_2" do
    it "counts the recursive number of bags" do
      expect(day_7.part_2).to eq(32)
    end
  end
end
