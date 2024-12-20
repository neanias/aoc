# frozen_string_literal: true

require "spec_helper"
require "day6"

RSpec.describe Day6 do
  subject(:day6) { described_class.new(problem_input) }
  let(:problem_input) { generate_input_path("day6") }

  describe "#part_one" do
    subject(:part_one) { day6.part_one }

    it { is_expected.to eq(41) }
  end
end
