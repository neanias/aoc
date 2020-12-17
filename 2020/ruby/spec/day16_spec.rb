# frozen_string_literal: true

require "day16"

RSpec.describe Day16 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_16) { described_class.new(problem_input) }

  describe "#part_1" do
    it "calculates the error rate" do
      expect(day_16.part_1).to eq(71)
    end
  end
end
