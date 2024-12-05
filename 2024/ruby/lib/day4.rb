# frozen_string_literal: true

require "matrix"

class Day4
  def initialize(word_search_file)
    @word_search = Matrix[*File.readlines(word_search_file, chomp: true).map(&:chars)]
  end

  # I have an overcount issue in this and I don't know why.
  def part_one
    xmases = Set.new
    @word_search.each_with_index do |letter, row, col|
      next unless letter == "X"

      ms = neighbours(row, col)
        .reject { _1[0] < 0 || _1[1] < 0 || _1[0] >= @word_search.row_size || _1[1] >= @word_search.column_size }
        .find_all { @word_search[*_1] == "M" }
      next unless ms

      ms.each do |(mrow, mcol)|
        direction = [mrow - row, mcol - col]
        a_pos = [mrow + direction[0], mcol + direction[1]]
        next if a_pos.any? { _1 < 0 || _1 > @word_search.row_size }
        next unless @word_search[*a_pos] == "A"
        s_pos = [a_pos[0] + direction[0], a_pos[1] + direction[1]].map { _1.clamp(0..) }
        next if s_pos.any? { _1 < 0 || _1 > @word_search.row_size }
        next unless @word_search[*s_pos] == "S"
        xmases.add([[row, col], [mrow, mcol], a_pos, s_pos])
      end
    end

    xmases.size
  end

  def part_two
    x_mases = Set.new
    @word_search.each_with_index do |letter, row, col|
      next unless letter == "A"

      tl = [row - 1, col - 1]
      next if tl.any? { _1 < 0 || _1 > @word_search.row_size }
      tr = [row - 1, col + 1]
      next if tr.any? { _1 < 0 || _1 > @word_search.row_size }
      bl = [row + 1, col - 1]
      next if bl.any? { _1 < 0 || _1 > @word_search.row_size }
      br = [row + 1, col + 1]
      next if br.any? { _1 < 0 || _1 > @word_search.row_size }

      if @word_search[*tl] == "M" && @word_search[*br] == "S" || @word_search[*tl] == "S" && @word_search[*br] == "M"
        if @word_search[*tr] == "M" && @word_search[*bl] == "S" || @word_search[*tr] == "S" && @word_search[*bl] == "M"
          x_mases.add([tr, tl, bl, br, [row, col]])
        end
      end
    end
    x_mases.size
  end

  def neighbours(row, col)
    [
      [row + 1, col + 1],
      [row + 1, col - 1],
      [row + 1, col],
      [row - 1, col + 1],
      [row - 1, col - 1],
      [row - 1, col],
      [row, col + 1],
      [row, col - 1]
    ]
  end
end
