# frozen_string_literal: true

require "day7"
require "spec_helper"

describe Day7 do
  subject(:day_seven) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the amount of fuel used" do
      expect(day_seven.part_one).to eq(37)
    end
  end

  describe "#part_two" do
    it "calculates the amount of fuel used" do
      expect(day_seven.part_two).to eq(168)
    end
  end
end
