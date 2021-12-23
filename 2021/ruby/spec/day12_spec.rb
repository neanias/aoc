# frozen_string_literal: true

require "day12"
require "spec_helper"

describe Day12 do
  subject(:day_twelve) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    it "finds the number of paths" do
      expect(day_twelve.part_one).to eq(10)
    end
  end
end
