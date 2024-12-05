# frozen_string_literal: true

require "spec_helper"
require "day5"

RSpec.describe Day5 do
  subject(:day_five) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day5") }

  describe "#part_one" do
    subject(:part_one) { day_five.part_one }

    it { is_expected.to eq(143) }
  end

  describe "#part_two" do
    subject(:part_two) { day_five.part_two }

    it { is_expected.to eq(123) }
  end
end
