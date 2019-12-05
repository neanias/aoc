# frozen_string_literal: true

require "day5/intcode"

RSpec.describe Intcode do
  subject(:computer) { described_class.new(memory) }

  context "when opcode is 1" do
    let(:memory) { [1, 0, 0, 0, 99] }

    it "processes correctly" do
      expect(computer.run).to eq([2, 0, 0, 0, 99])
    end
  end

  context "when opcode is 2" do
    let(:memory) { [2, 3, 0, 3, 99] }

    it "processes correctly" do
      expect(computer.run).to eq([2, 3, 0, 6, 99])
    end
  end

  context "when opcode is 99" do
    let(:memory) { [2, 4, 4, 5, 99, 0] }

    it "processes correctly" do
      expect(computer.run).to eq([2, 4, 4, 5, 99, 9801])
    end
  end
end
