# frozen_string_literal: true

require "day5"
require "spec_helper"

describe Day5 do
  subject(:day_five) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the lines that overlap" do
      expect(day_three.part_one).to eq(5)
    end
  end
end
