# frozen_string_literal: true

require "day11"
require "spec_helper"

describe Day11 do
  subject(:day_eleven) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "counts the number of flashes" do
      expect(day_eleven.part_one).to eq(1656)
    end
  end

  describe "#part_two" do
    it "finds the first all zero step" do
      expect(day_eleven.part_two).to eq(195)
    end
  end
end
