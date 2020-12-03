# frozen_string_literal: true

require "day3"

RSpec.describe Day3 do
  let(:problem_input) { generate_input_path(described_class.name.downcase) }
  subject(:day_3) { described_class.new(problem_input) }

  describe "#part_1" do
    it "counts the number of trees in the descent" do
      expect(day_3.part_1).to eq(7)
    end
  end

  describe "#part_2" do
    let(:movements) { [[1,1], [3,1], [5,1], [7,1], [1,2]] }

    it "counts all the trees in all the descents" do
      expect(day_3.part_2(movements: movements)).to eq(336)
    end
  end
end
