# frozen_string_literal: true

require "day21"
require "spec_helper"

describe Day21 do
  subject(:day_twenty_one) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "calculates the output" do
      expect(day_twenty_one.part_one).to eq(739_785)
    end
  end

  describe "#part_two" do
    it "calculates the output" do
      expect(day_twenty_one.part_two).to eq(444_356_092_776_315)
    end
  end
end
