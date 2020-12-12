# frozen_string_literal: true

require "set"

class Day11
  def initialize(waiting_room_file)
    @waiting_room = File.readlines(waiting_room_file, chomp: true).map { _1.split("") }
  end

  def part_1
    waiting_room = deep_dup(@waiting_room)
    occupied = deep_dup(waiting_room)
    changing = true

    while changing
      changing = false

      waiting_room.each_with_index do |row, i|
        row.each_with_index do |pos, j|
          if is_chair?(pos) && is_open?(i, j, waiting_room)
            occupied[i][j] = "#"
            changing = true
          elsif is_taken?(pos) && should_be_empty?(i, j, waiting_room)
            occupied[i][j] = "L"
            changing = true
          end
        end
      end

      waiting_room = deep_dup(occupied)
    end

    waiting_room.sum { |row| row.count { |spot| is_taken?(spot) } }
  end

  def part_2
    waiting_room = deep_dup(@waiting_room)
    occupied = deep_dup(waiting_room)
    changing = true

    while changing
      changing = false
      waiting_room.each_with_index do |row, i|
        row.each_with_index do |pos, j|
          seats = (axis(i, j, waiting_room) + diagonals(i, j, waiting_room))
            .reject(&:nil?)
            .map { waiting_room[_1][_2] }
            .tally
          if is_chair?(pos) && seats.fetch("#", 0) == 0
            occupied[i][j] = "#"
            changing = true
          elsif is_taken?(pos) && seats.fetch("#", 0) >= 5
            occupied[i][j] = "L"
            changing = true
          end
        end
      end

      waiting_room = deep_dup(occupied)
    end

    waiting_room.sum { |row| row.count { |spot| is_taken?(spot) } }
  end

  private

  def deep_dup(arr)
    Marshal.load(Marshal.dump(arr))
  end

  def is_chair?(char)
    char == "L"
  end

  def is_taken?(char)
    char == "#"
  end

  def is_floor?(char)
    char == "."
  end

  def is_open?(row, pos, chairs = @waiting_room)
    surrounding(row, pos, chairs).tally.fetch("#", 0) == 0
  end

  def should_be_empty?(row, pos, chairs = @waiting_room)
    surrounding(row, pos, chairs).tally.fetch("#", 0) >= 4
  end

  def surrounding(row, pos, chairs = @waiting_room)
    index_pair = [row - 1, row, row + 1].each_with_object([]) do |n, arr|
      next if n < 0 || n >= chairs.size
      arr.concat([pos - 1, pos, pos + 1].reject { _1 < 0 || _1 >= chairs.size }.map { [n, _1] })
    end
    index_pair.difference([[row, pos]]).map { |row_idx, pos_idx| chairs[row_idx][pos_idx] }
  end

  def axis(row, pos, chairs = @waiting_room)
    [
      row.downto(0).lazy.zip([pos].cycle),
      pos.upto(chairs.size - 1).lazy.zip([row].cycle).map(&:reverse),
      row.upto(chairs.size - 1).lazy.zip([pos].cycle),
      pos.downto(0).lazy.zip([row].cycle).map(&:reverse),
    ].map do |coords_enum|
      coords_enum.find do |x, y|
        next if (x == row && y == pos) || ![x, y].all?
        space = chairs[x][y]
        !space.nil? && !is_floor?(space)
      end
    end
  end

  def diagonals(row, pos, chairs = @waiting_room)
    [
      row.downto(0).lazy.zip(pos.downto(0)),
      row.downto(0).lazy.zip(pos.upto(chairs.size - 1)),
      row.upto(chairs.size - 1).lazy.zip(pos.downto(0)),
      row.upto(chairs.size - 1).lazy.zip(pos.upto(chairs.size - 1)),
    ].map do |coords_enum|
      coords_enum.find do |x, y|
        next if (x == row && y == pos) || ![x, y].all?
        space = chairs[x][y]
        !space.nil? && !is_floor?(space)
      end
    end
  end
end
