# frozen_string_literal: true

require "spec_helper"
require "day11"

RSpec.describe Day11 do
  subject(:day11) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day11") }

  describe "#part_one" do
    subject(:part_one) { day11.part_one }

    it { is_expected.to eq(55312) }
  end
end
