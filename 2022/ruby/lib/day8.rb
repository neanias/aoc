# typed: true
# frozen_string_literal: true

require "matrix"
require "sorbet-runtime"

class Day8
  extend T::Sig

  def initialize(map_file)
    @map = Matrix[*File.readlines(map_file, chomp: true).map { _1.chars.map(&:to_i) }]
  end

  def part_one
    visible_trees = ((@map.row_size + @map.column_size) * 2) - 4 # take off the corners
    inner_indices = 1..(@map.row_size - 2)
    inner_indices.each do |i|
      inner_indices.each do |j|
        tree = @map[i, j]
        visible = (
          @map.row(i)[...j].max < tree || @map.row(i)[j+1..].max < tree ||
          @map.column(j)[...i].max < tree || @map.column(j)[i+1..].max < tree
        )
        visible_trees += 1 if visible
      end
    end

    visible_trees
  end

  def part_two
    scenic_score = 0

    @map.each_with_index do |tree, i, j|
      row = @map.row(i)
      column = @map.column(j)

      left = calculate_score(row[...j].reverse, tree)
      right = calculate_score(row[j+1..], tree)
      up = calculate_score(column[...i].reverse, tree)
      down = calculate_score(column[i+1..], tree)

      score = T.let(left * right * up * down, Integer)
      scenic_score = score if score > scenic_score
    end

    scenic_score
  end

  def calculate_score(sight_line, tree)
    # Using `take_while { _1 <= tree }` would look past the blocking tree if
    # it's the same height as the current tree.
    see = sight_line.take_while { _1 < tree }
    if see.size < sight_line.size
      see.size + 1
    else
      sight_line.size
    end
  end
end
