# frozen_string_literal: true

require "spec_helper"
require "day23"

RSpec.describe Day23 do
  subject(:day23) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day23") }

  describe "#part_one" do
    subject(:part_one) { day23.part_one }

    it { is_expected.to eq(7) }
  end
end
