# frozen_string_literal: true

require "spec_helper"
require "day24"

RSpec.describe Day24 do
  subject(:day24) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day24") }

  describe "#part_one" do
    subject(:part_one) { day24.part_one }

    context "simple example" do
      it { is_expected.to eq(4) }
    end

    context "complex example" do
      let(:problem_input) { generate_input_path("day24_2") }

      it { is_expected.to eq(2024) }
    end
  end
end
