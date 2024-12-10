# frozen_string_literal: true

require "spec_helper"
require "day10"

RSpec.describe Day10 do
  subject(:day10) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day10") }

  describe "#part_one" do
    subject(:part_one) { day10.part_one }

    it { is_expected.to eq(36) }
  end

  describe "#part_two" do
    subject(:part_two) { day10.part_two }

    it { is_expected.to eq(81) }
  end
end
