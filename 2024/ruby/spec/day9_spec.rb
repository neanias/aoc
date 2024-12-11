# frozen_string_literal: true

require "spec_helper"
require "day9"

RSpec.describe Day9 do
  subject(:day9) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day9") }

  describe "#part_one" do
    subject(:part_one) { day9.part_one }

    it { is_expected.to eq(1928) }
  end

  describe "#part_two" do
    subject(:part_two) { day9.part_two }

    it { is_expected.to eq(2858) }
  end
end
