# frozen_string_literal: true

class Day1
  def initialize(calibrations_file)
    @calibrations = File.readlines(calibrations_file, chomp: true)
  end

  def part_one
    @calibrations.sum do |line|
      nums = line.scan(/\d/)
      "#{nums[0]}#{nums[-1]}".to_i
    end
  end

  def part_two
    nums_in_words = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9
    }
    nums_regex = /#{nums_in_words.keys.join("|")}|\d/

    @calibrations.sum do |line|
      first = line.scan(nums_regex)[0]
      last_index = line.rindex(nums_regex)
      last = line[last_index..].scan(nums_regex)[0]
      "#{nums_in_words[first] || first}#{nums_in_words[last] || last}".to_i
    end
  end
end
