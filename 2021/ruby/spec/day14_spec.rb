# frozen_string_literal: true

require "day14"
require "spec_helper"

describe Day14 do
  subject(:day_fourteen) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "subtracts the largest and smallest" do
      expect(day_fourteen.part_one).to eq(1588)
    end
  end

  describe "#part_two" do
    it "subtracts the largest and smallest" do
      expect(day_fourteen.part_two).to eq(2_188_189_693_529)
    end
  end
end
