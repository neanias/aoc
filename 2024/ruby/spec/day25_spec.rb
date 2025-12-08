# frozen_string_literal: true

require "spec_helper"
require "day25"

RSpec.describe Day25 do
  subject(:day25) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day25") }

  describe "#part_one" do
    subject(:part_one) { day25.part_one }

    it { is_expected.to eq(3) }
  end
end
