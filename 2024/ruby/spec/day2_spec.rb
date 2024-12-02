# frozen_string_literal: true

require "spec_helper"
require "day2"

RSpec.describe Day2 do
  subject(:day_two) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day2") }

  describe "#part_one" do
    subject(:part_one) { day_two.part_one }

    it { is_expected.to eq(2) }
  end

  describe "#part_two" do
    subject(:part_two) { day_two.part_two }

    it { is_expected.to eq(4) }
  end
end
