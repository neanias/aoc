# typed: false
# frozen_string_literal: true

require "day12"
require "spec_helper"

describe Day12 do
  subject(:day_twelve) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_twelve.part_one }

    it { is_expected.to eq(31) }
  end

  describe "#part_two" do
    subject(:part_two) { day_twelve.part_two }

    it { is_expected.to eq(29) }
  end
end
