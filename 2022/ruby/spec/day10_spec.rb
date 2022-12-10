# typed: false
# frozen_string_literal: true

require "day10"
require "spec_helper"

describe Day10 do
  subject(:day_ten) { described_class.new(problem_input) }

  let(:problem_input) { generate_input_path(described_class.name.downcase) }

  describe "#part_one" do
    subject(:part_one) { day_ten.part_one }

    it { is_expected.to eq(13_140) }
  end

  describe "#part_two" do
    subject(:part_two) { day_ten.part_two }

    it "matches the output" do
      expect(part_two).to eq(<<~CRT)
        ##..##..##..##..##..##..##..##..##..##..
        ###...###...###...###...###...###...###.
        ####....####....####....####....####....
        #####.....#####.....#####.....#####.....
        ######......######......######......####
        #######.......#######.......#######.....
      CRT
    end
  end
end
