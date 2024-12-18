# frozen_string_literal: true

require "spec_helper"
require "day17"

RSpec.describe Day17 do
  subject(:day17) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day17") }

  describe "#part_one" do
    subject(:part_one) { day17.part_one }

    it { is_expected.to eq("4,6,3,5,6,3,5,2,1,0") }
  end

  describe "#part_two" do
    let(:problem_input) { generate_input_path("day17_2") }
    subject(:part_two) { day17.part_two }

    it { is_expected.to eq(117440) }
  end
end
