# frozen_string_literal: true

require "day2"
require "spec_helper"

RSpec.describe Day2 do
  subject(:day_two) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day2") }

  describe "#part_one" do
    subject(:part_one) { day_two.part_one }

    it { is_expected.to eq(101) }
  end

  describe "#part_two" do
    subject(:part_two) { day_two.part_two }

    it { is_expected.to eq(48) }
  end
end
