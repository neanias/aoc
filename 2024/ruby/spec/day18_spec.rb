# frozen_string_literal: true

require "spec_helper"
require "day18"

RSpec.describe Day18 do
  subject(:day18) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day18") }

  describe "#part_one" do
    subject(:part_one) { day18.part_one }

    it { is_expected.to eq(22) }
  end

  describe "#part_two" do
    subject(:part_two) { day18.part_two }

    it { is_expected.to eq([6, 1]) }
  end
end
