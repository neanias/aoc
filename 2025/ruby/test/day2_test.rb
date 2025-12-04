# frozen_string_literal: true

require "minitest/autorun"

require "day2"

class TestDay2 < Minitest::Test
  parallelize_me!

  LINES = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

  def test_part_1
    assert_equal day_2_part_1(LINES), 1227775554
  end
end
