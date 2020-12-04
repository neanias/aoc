# frozen_string_literal: true

require "day4"

RSpec.describe Day4 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_4) { described_class.new(problem_input) }

  describe "#part_1" do
    it "finds the valid passports" do
      expect(day_4.part_1).to eq(2)
    end
  end

  describe '#part_2' do
    it 'counts the valid passports' do
      expect(day_4.part_2).to eq(2)
    end
  end
end
