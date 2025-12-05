# frozen_string_literal: true

def day_6_part_1(maths_sheet)
  *nums, ops = maths_sheet.lines(chomp: true).map(&:split)
  nums[0].zip(*nums[1..]).each_with_index.sum { |col, idx| col.map(&:to_i).reduce(ops[idx]) }
end

def day_6_part_2(maths_sheet)
  rotated_sheet = maths_sheet.lines(chomp: true).map(&:chars).transpose
  rotated_sheet.chunk_while { !it.all?(" ") }.sum do |col|
    op = col[0][-1]
    col.map { |chars| chars.take(chars.length - 1).join.to_i }.reject(&:zero?).reduce(op.to_sym)
  end
end
