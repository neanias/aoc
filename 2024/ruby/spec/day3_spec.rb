# frozen_string_literal: true

require "spec_helper"
require "day3"

RSpec.describe Day3 do
  subject(:day_three) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day3") }

  describe "#part_one" do
    subject(:part_one) { day_three.part_one }

    it { is_expected.to eq(161) }
  end

  describe "#part_two" do
    subject(:part_two) { day_three.part_two }

    let(:problem_input) { generate_input_path("day3_2") }

    it { is_expected.to eq(48) }
  end
end
