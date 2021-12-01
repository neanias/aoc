# frozen_string_literal: true

require "day1"
require "spec_helper"

describe Day1 do
  subject(:day_one) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates increasing depth measurements" do
      expect(day_one.part_one).to eq(7)
    end
  end

  describe "#part_two" do
    it "calculates depth measurements for sliding windows" do
      expect(day_one.part_two).to eq(5)
    end
  end
end
