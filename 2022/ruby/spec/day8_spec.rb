# typed: false
# frozen_string_literal: true

require "day8"
require "spec_helper"

describe Day8 do
  subject(:day_eight) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_eight.part_one }

    it { is_expected.to eq(21) }
  end

  describe "#part_two" do
    subject(:part_two) { day_eight.part_two }

    it { is_expected.to eq(8) }
  end
end
