# frozen_string_literal: true

require "day14"

RSpec.describe Day14 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_14) { described_class.new(problem_input) }

  describe "#part_1" do
    it "calculates the sum left in the memory" do
      expect(day_14.part_1).to eq(165)
    end
  end
end
