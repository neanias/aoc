# typed: false
# frozen_string_literal: true

require "day4"
require "spec_helper"

describe Day4 do
  subject(:day_four) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_four.part_one }

    it { is_expected.to eq(2) }
  end

  describe "#part_two" do
    subject(:part_two) { day_four.part_two }

    it { is_expected.to eq(4) }
  end
end
