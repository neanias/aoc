# typed: false
# frozen_string_literal: true

require "day5"
require "spec_helper"

describe Day5 do
  subject(:day_five) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_five.part_one }

    it { is_expected.to eq("CMZ") }
  end

  describe "#part_two" do
    subject(:part_two) { day_five.part_two }

    it { is_expected.to eq("MCD") }
  end
end
