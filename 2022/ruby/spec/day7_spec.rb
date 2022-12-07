# typed: false
# frozen_string_literal: true

require "day7"
require "spec_helper"

describe Day7 do
  subject(:day_seven) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_seven.part_one }

    it { is_expected.to eq(95_437) }
  end

  describe "#part_two" do
    subject(:part_two) { day_seven.part_two }

    it { is_expected.to eq(24_933_642) }
  end
end
