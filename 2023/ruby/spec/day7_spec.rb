# frozen_string_literal: true

require "spec_helper"
require "day7"

RSpec.describe Day7 do
  subject(:day_seven) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path("day7") }

  describe "#part_one" do
    subject(:part_one) { day_seven.part_one }

    it { is_expected.to eq(6440) }
  end
end
