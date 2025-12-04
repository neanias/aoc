# frozen_string_literal: true

require "minitest/autorun"

require "day1"

class TestDay1 < Minitest::Test
  INSTRUCTIONS = <<~INST
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
  INST

  parallelize_me!

  def test_part_1
    assert_equal day_1_part_1(INSTRUCTIONS), 3
  end

  def test_part_2
    assert_equal day_1_part_2(INSTRUCTIONS), 6
  end
end
