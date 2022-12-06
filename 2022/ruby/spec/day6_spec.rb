# typed: false
# frozen_string_literal: true

require "day6"
require "spec_helper"

describe Day6 do
  subject(:day_six) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_six.part_one }

    it { is_expected.to eq(7) }
  end

  describe "#part_two" do
    subject(:part_two) { day_six.part_two }

    it { is_expected.to eq(19) }
  end
end
