# frozen_string_literal: true

require "spec_helper"
require "day15"

RSpec.describe Day15 do
  subject(:day15) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day15") }

  describe "#part_one" do
    subject(:part_one) { day15.part_one }

    it { is_expected.to eq(10092) }
  end
end
