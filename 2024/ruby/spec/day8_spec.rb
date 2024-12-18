# frozen_string_literal: true

require "spec_helper"
require "day8"

RSpec.describe Day8 do
  subject(:day8) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day8") }

  describe "#part_one" do
    subject(:part_one) { day8.part_one }

    it { is_expected.to eq(14) }
  end

  describe "#part_two" do
    subject(:part_two) { day8.part_two }

    it { is_expected.to eq(34) }
  end
end
