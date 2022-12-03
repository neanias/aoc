# typed: false
# frozen_string_literal: true

require "day3"
require "spec_helper"

describe Day3 do
  subject(:day_three) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_three.part_one }

    it { is_expected.to eq(157) }
  end

  describe "#part_two" do
    subject(:part_two) { day_three.part_two }

    it { is_expected.to eq(70) }
  end
end
