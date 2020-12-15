# frozen_string_literal: true

class Day14
  def initialize(mask_mems_file)
    @mask_mems = File.readlines(mask_mems_file, chomp: true)
  end

  def part_1
    mem = Hash.new(0)
    mask = ""
    @mask_mems.each do |entry|
      assgn, value = entry.split(" = ")
      if assgn == "mask"
        mask = value
        next
      end

      num = mask.chars.zip(35.downto(0).map { value.to_i[_1].to_s }).map { |l, r| l == "X" ? r : l }.join.to_i(2)
      idx = assgn.scan(/\d+/)[0].to_i
      mem[idx] = num
    end
    mem.values.sum
  end
end
