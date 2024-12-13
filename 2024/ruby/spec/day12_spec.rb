# frozen_string_literal: true

require "spec_helper"
require "day12"

RSpec.describe Day12 do
  subject(:day12) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day12") }

  describe "#part_one" do
    subject(:part_one) { day12.part_one }

    it { is_expected.to eq(1930) }
  end

  describe "#part_two" do
    subject(:part_two) { day12.part_two }

    it { is_expected.to eq(1206) }
  end
end
