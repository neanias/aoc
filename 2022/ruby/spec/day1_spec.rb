# frozen_string_literal: true

require "day1"
require "spec_helper"

describe Day1 do
  subject(:day_one) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_one.part_one }

    it { is_expected.to be(24_000) }
  end

  describe "#part_two" do
    subject(:part_two) { day_one.part_two }

    it { is_expected.to be(45_000) }
  end
end
