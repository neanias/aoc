# frozen_string_literal: true

require "day13"

RSpec.describe Day13 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_13) { described_class.new(problem_input) }

  describe "#part_1" do
    it "finds the bus ID multiple" do
      expect(day_13.part_1).to eq(295)
    end
  end

  describe "#part_1" do
    it "finds the time when bus IDs are in a line" do
      expect(day_13.part_2).to eq(1068781)
    end
  end
end
