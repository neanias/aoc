# typed: false
# frozen_string_literal: true

require "day11"
require "spec_helper"

describe Day11 do
  subject(:day_eleven) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "part_one" do
    subject(:part_one) { day_eleven.part_one }

    it { is_expected.to eq(10_605) }
  end

  describe "#part_two" do
    subject(:part_two) { day_eleven.part_two }

    it { is_expected.to eq(2_713_310_158) }
  end
end
