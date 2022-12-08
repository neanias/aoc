# typed: true
# frozen_string_literal: true

require "matrix"
require "sorbet-runtime"

class Day8
  extend T::Sig

  def initialize(map_file)
    @map = T.let(Matrix[*File.readlines(map_file, chomp: true).map { _1.chars.map(&:to_i) }], Matrix)
  end

  def part_one
    # Take away 4 to not double count the corners
    visible_trees = T.let(((@map.row_count + @map.column_count) * 2) - 4, Integer)
    inner_indices = T.let(1..(@map.row_count - 2), T::Range[Integer])
    inner_indices.each do |i|
      inner_indices.each do |j|
        tree = T.let(@map[i, j], Integer)
        visible = T.let(
          @map.row(i)[...j].max < tree || @map.row(i)[j+1..].max < tree ||
          @map.column(j)[...i].max < tree || @map.column(j)[i+1..].max < tree,
          T::Boolean
        )
        visible_trees += 1 if visible
      end
    end

    visible_trees
  end

  def part_two
    scenic_score = 0

    @map.each_with_index do |tree, i, j|
      row = T.let(@map.row(i), Vector)
      column = T.let(@map.column(j), Vector)

      left = calculate_score(row[...j].reverse, tree)
      right = calculate_score(row[j+1..], tree)
      up = calculate_score(column[...i].reverse, tree)
      down = calculate_score(column[i+1..], tree)

      score = left * right * up * down
      scenic_score = score if score > scenic_score
    end

    scenic_score
  end

  private

  sig { params(sight_line: T.any(Vector, T::Array[Integer]), tree: Integer).returns(Integer) }
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
