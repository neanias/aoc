# frozen_string_literal: true

require "day5"

RSpec.describe Day5 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_5) { described_class.new(problem_input) }

  describe "#part_1" do
    it "finds the highest seat ID" do
      expect(day_5.part_1).to eq(820)
    end
  end
end
