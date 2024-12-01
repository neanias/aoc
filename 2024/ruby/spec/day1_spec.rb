# frozen_string_literal: true

require "spec_helper"
require "day1"

RSpec.describe Day1 do
  subject(:day_one) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day1") }

  describe "#part_one" do
    subject(:part_one) { day_one.part_one }

    it { is_expected.to eq(11) }
  end

  describe "#part_two" do
    subject(:part_two) { day_one.part_two }

    it { is_expected.to eq(31) }
  end
end
