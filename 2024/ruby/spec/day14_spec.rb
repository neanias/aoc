# frozen_string_literal: true

require "spec_helper"
require "day14"

RSpec.describe Day14 do
  subject(:day14) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day14") }

  describe "#part_one" do
    subject(:part_one) { day14.part_one }

    it { is_expected.to eq(12) }
  end
end
