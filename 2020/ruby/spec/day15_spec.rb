# frozen_string_literal: true

require "day15"

RSpec.describe Day15 do
  let(:problem_inputs) do
    [
      [0, 3, 6],
      [1, 3, 2],
      [2, 1, 3],
      [1, 2, 3],
      [2, 3, 1],
      [3, 2, 1],
      [3, 1, 2],
    ]
  end

  describe "#part_1" do
    let(:problem_outputs) { [436, 1, 10, 27, 78, 438, 1836] }

    it "calculates the 2020th turn for the inputs" do
      problem_inputs.zip(problem_outputs).each { expect(Day15.new(_1).part_1).to eq(_2) }
    end
  end

  describe "#part_2" do
    let(:problem_outputs) do
      [175594, 2578, 3544142, 261214, 6895259, 18, 362]
    end

    it "calculates the 2020th turn for the inputs" do
      problem_inputs.zip(problem_outputs).lazy.each { expect(Day15.new(_1, 30000000).part_2).to eq(_2) }
    end
  end
end
