# typed: false
# frozen_string_literal: true

require "day14"
require "spec_helper"

describe Day14 do
  subject(:day_fourteen) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_fourteen.part_one }

    it { is_expected.to eq(24) }
  end

  describe "#part_two" do
    subject(:part_two) { day_fourteen.part_two }

    it { is_expected.to eq(93) }
  end
end
