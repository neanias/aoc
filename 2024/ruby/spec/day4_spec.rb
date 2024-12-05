# frozen_string_literal: true

require "spec_helper"
require "day4"

RSpec.describe Day4 do
  subject(:day_four) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day4") }

  describe "#part_one" do
    subject(:part_one) { day_four.part_one }

    it { is_expected.to eq(18) }
  end

  describe "#part_two" do
    subject(:part_two) { day_four.part_two }

    it { is_expected.to eq(9) }
  end
end
