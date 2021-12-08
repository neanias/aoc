# frozen_string_literal: true

require "day8"
require "spec_helper"

describe Day8 do
  subject(:day_eight) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "counts the number of unique digits" do
      expect(day_eight.part_one).to eq(26)
    end
  end

  describe "#part_two" do
    it "counts the number of unique digits" do
      expect(day_eight.part_two).to eq(61_229)
    end
  end
end
