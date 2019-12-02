# frozen_string_literal: true

require "pathname"
require "day1"

RSpec.describe Day1 do
  subject(:day_1) { described_class.new }

  before do
    day_1.process_input(generate_fixture_path("day1_input"))
  end

  it "calculates how much fuel is required" do
    expect(day_1.part_1).to eq(34_241)
  end

  it "calculates extra fuel as well" do
    expect(day_1.part_2).to eq(51_316)
  end

  def generate_fixture_path(filename)
    File.expand_path(File.join("spec", "fixtures", filename + ".txt"))
  end
end
