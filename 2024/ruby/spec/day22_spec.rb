# frozen_string_literal: true

require "spec_helper"
require "day22"

RSpec.describe Day22 do
  subject(:day22) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day22") }

  describe "#part_one" do
    subject(:part_one) { day22.part_one }

    it { is_expected.to eq(37327623) }
  end

  describe "#part_two" do
    subject(:part_two) { day22.part_two }

    let(:problem_input) { generate_input_path("day22_2") }

    it { is_expected.to eq(23) }
  end
end
