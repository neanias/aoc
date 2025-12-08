# frozen_string_literal: true

require "spec_helper"
require "day8"

RSpec.describe Day8 do
  subject(:day_eight) { Day8.new(problem_input) }

  let(:problem_input) { generate_input_path("day8") }

  describe "#part_one" do
    subject(:part_one) { day_eight.part_one }

    it { is_expected.to eq(12) }
  end

  describe "#part_two" do
    subject(:part_two) { day_eight.part_two }

    it { is_expected.to eq(19) }
  end
end
