# frozen_string_literal: true

require "spec_helper"
require "day9"

RSpec.describe Day9 do
  subject(:day_nine) { Day9.new(problem_input) }

  let(:problem_input) { generate_input_path("day9") }

  describe "#part_one" do
    subject(:part_one) { day_nine.part_one }

    it { is_expected.to eq(605) }
  end
end
