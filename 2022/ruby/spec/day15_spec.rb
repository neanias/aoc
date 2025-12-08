# typed: false
# frozen_string_literal: true

require "day15"
require "spec_helper"

describe Day15 do
  subject(:day_fifteen) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_fifteen.part_one }

    it { is_expected.to eq(26) }
  end
end
