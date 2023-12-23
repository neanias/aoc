# frozen_string_literal: true

require "spec_helper"
require "day3"

RSpec.describe Day3 do
  subject(:day_three) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day3") }

  describe "#part_one" do
    subject(:part_one) { day_three.part_one }

    it { is_expected.to eq(4361) }
  end

  describe "#part_two" do
    subject(:part_two) { day_three.part_two }

    it { is_expected.to eq(467835) }
  end
end
