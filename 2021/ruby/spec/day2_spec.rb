# frozen_string_literal: true

require "day2"
require "spec_helper"

describe Day2 do
  subject(:day_two) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the position" do
      expect(day_two.part_one).to eq(150)
    end
  end

  describe "#part_two" do
    it "calculates the position" do
      expect(day_two.part_two).to eq(900)
    end
  end
end
