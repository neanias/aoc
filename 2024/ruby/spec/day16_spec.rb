# frozen_string_literal: true

require "spec_helper"
require "day16"

RSpec.describe Day16 do
  subject(:day16) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day16") }

  describe "#part_one" do
    subject(:part_one) { day16.part_one }

    it { is_expected.to eq(7036) }

    context "for a larger grid" do
      let(:problem_input) { generate_input_path("day16_larger") }

      it { is_expected.to eq(11048) }
    end

    context "for a surprising grid" do
      let(:problem_input) { generate_input_path("day16_3") }

      it { is_expected.to eq(21148) }
    end
  end
end
