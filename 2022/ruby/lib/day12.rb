# typed: true
# frozen_string_literal: true

require "matrix"
require "set"

require "async"
require "async/barrier"

class Day12
  class Node
    attr_accessor :parent
    attr_reader :position, :letter

    def initialize(letter:, position:)
      @letter = letter
      @position = position
      @parent = nil
    end

    def to_s
      "Node(letter: #{letter}, position: #{position})"
    end

    def target? = @letter == "E"

    def can_move_to?(other)
      (
        (other.letter == "E" && letter == "z") ||
        other.letter == "S" ||
        other.letter == "a" ||
        (other.letter >= "a" && # control for capitals
          (letter.ord >= other.letter.ord || letter.succ == other.letter)
        )
      )
    end
  end

  def initialize(elevation_file)
    @elevation_map = Matrix[*File.readlines(elevation_file, chomp: true).map(&:chars)]

    starting_location = @elevation_map.index { _1 == "S" }
    @starting_node = Node.new(letter: "S", position: starting_location)
  end

  def part_one
    find_shortest_path(@starting_node)
  end

  # No noticeable speed increase
  def part_two_async
    starting_points = [@starting_node.position]
    @elevation_map.each_with_index do |letter, x, y|
      next unless letter == "a"

      starting_points.push([x, y])
    end

    barrier = Async::Barrier.new
    paths = []
    Async do
      starting_points.each do |point|
        barrier.async do
          paths.append(find_shortest_path(Node.new(letter: "a", position: point)))
        end
      end

      barrier.wait
    end

    paths.reject(&:zero?).min
  end

  def part_two
    starting_points = [@starting_node.position]
    @elevation_map.each_with_index do |letter, x, y|
      next unless letter == "a"

      starting_points.push([x, y])
    end

    starting_points.map { find_shortest_path(Node.new(letter: "a", position: _1)) }.reject(&:zero?).min
  end

  private

  def neighbours(map, row, column)
    [
      [row - 1, column], [row, column - 1], [row + 1, column], [row, column + 1]
    ].reject do |(r, c)|
      pair = [r, c]
      next if pair.any?(-1) || r >= map.row_count || c >= map.column_count

      yield pair
    end
  end

  def find_shortest_path(starting_node)
    frontier = Queue.new.push(starting_node)
    visited = Set.new([starting_node.position])
    target = nil

    until frontier.empty?
      current = frontier.pop

      visited.add(current.position)
      neighbours(@elevation_map, *current.position) do |position|
        node = Node.new(letter: @elevation_map[*position], position: position)
        node.parent = current

        next if visited.include?(node.position) || !current.can_move_to?(node)

        if node.target?
          target = node
          break
        end

        frontier.push(node)
        visited.add(node.position)
      end

      break if target&.target?
    end

    path_size = 0
    if target
      node = target
      while node.parent
        node = node.parent
        path_size += 1
      end
    end

    path_size
  end
end
