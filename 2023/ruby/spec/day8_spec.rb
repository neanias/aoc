# frozen_string_literal: true

require "spec_helper"
require "day8"

RSpec.describe Day8 do
  subject(:day_eight) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day8_1") }

  describe "#part_one" do
    subject(:part_one) { day_eight.part_one }

    context "with a short path" do
      it { is_expected.to eq(2) }
    end

    context "with a long path" do
      let(:problem_input) { generate_input_path("day8_2") }

      it { is_expected.to eq(6) }
    end
  end
end
