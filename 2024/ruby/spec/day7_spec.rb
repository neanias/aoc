# frozen_string_literal: true

require "spec_helper"
require "day7"

RSpec.describe Day7 do
  subject(:day7) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day7") }

  describe "#part_one" do
    subject(:part_one) { day7.part_one }

    it { is_expected.to eq(3749) }
  end

  describe "#part_two" do
    subject(:part_two) { day7.part_two }

    it { is_expected.to eq(11387) }
  end
end
