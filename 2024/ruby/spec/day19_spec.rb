# frozen_string_literal: true

require "spec_helper"
require "day19"

RSpec.describe Day19 do
  subject(:day19) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day19") }

  describe "#part_one" do
    subject(:part_one) { day19.part_one }

    it { is_expected.to eq(6) }
  end

  describe "#part_two" do
    subject(:part_two) { day19.part_two }

    it { is_expected.to eq(16) }
  end
end
