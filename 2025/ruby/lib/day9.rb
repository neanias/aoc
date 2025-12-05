# frozen_string_literal: true

def day_9_part_1(coords)
  corners = coords.lines(chomp: true).map { it.split(",").map(&:to_i) }
  area = ->(l, r) { ((l[0] - r[0]).abs + 1) * ((l[1] - r[1]).abs + 1) }
  max = corners.combination(2).max_by { |l, r| area.call(l, r) }
  area.call(*max)
end
