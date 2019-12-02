# frozen_string_literal: true

require "day2"

RSpec.describe Day2 do
  subject(:day_2) { described_class.new }

  it "processes opcode 1 correctly" do
    day_2.programme = process_input("1,0,0,0,99")
    expect(day_2.part_1).to eq("2,0,0,0,99")
  end

  it "processes opcode 2 correctly" do
    day_2.programme = process_input("2,3,0,3,99")
    expect(day_2.part_1).to eq("2,3,0,6,99")
  end

  it "processes opcode 99 correctly" do
    day_2.programme = process_input("2,4,4,5,99,0")
    expect(day_2.part_1).to eq("2,4,4,5,99,9801")
  end

  def process_input(input)
    input.split(",").map(&:to_i)
  end
end
