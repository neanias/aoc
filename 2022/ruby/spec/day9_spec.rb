# typed: false
# frozen_string_literal: true

require "day9"
require "spec_helper"

describe Day9 do
  subject(:day_nine) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_nine.part_one }

    it { is_expected.to eq(13) }
  end

  describe "#part_two" do
    subject(:part_two) { day_nine.part_two }

    it { is_expected.to eq(1) }
  end
end
