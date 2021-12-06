# frozen_string_literal: true

require "day6"
require "spec_helper"

describe Day6 do
  subject(:day_six) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the number of lanternfish" do
      expect(day_six.part_one).to eq(5934)
    end
  end

  describe "#part_two" do
    it "calculates the number of lanternfish" do
      expect(day_six.part_two).to eq(26_984_457_539)
    end
  end
end
