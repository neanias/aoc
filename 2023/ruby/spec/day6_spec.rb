# frozen_string_literal: true

require "spec_helper"
require "day6"

RSpec.describe Day6 do
  subject(:day_six) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day6") }

  describe "#part_one" do
    subject(:part_one) { day_six.part_one }

    it { is_expected.to eq(288) }
  end

  describe "#part_two" do
    subject(:part_two) { day_six.part_two }

    it { is_expected.to eq(71503) }
  end
end
