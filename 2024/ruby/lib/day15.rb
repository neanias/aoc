# frozen_string_literal: true

require "matrix"

class Day15
  MOVES = {"<" => Vector[0, -1], "v" => Vector[1, 0], ">" => Vector[0, 1], "^" => Vector[-1, 0]}.freeze

  def initialize(maze_file)
    maze, moves = File.read(maze_file, chomp: true).split("\n\n")
    @maze = Matrix[*maze.lines(chomp: true).map(&:chars)]
    @moves = moves.lines(chomp: true).join.chars
  end

  def part_one
    maze = @maze.dup

    robot = Vector[*maze.index("@")]
    @moves.each do |move|
      direction = MOVES[move]
      new_pos = robot + direction
      new_space = maze[*new_pos]
      if new_space == "#"
        next
      elsif new_space == "."
        maze[*new_pos] = "@"
        maze[*robot] = "."
        robot = new_pos
      elsif new_space == "O" && can_move?(maze, new_pos, direction)
        os = trace_os(maze, new_pos, direction)
        os.each { |o| maze[*(o + direction)] = "O" }
        maze[*new_pos] = "@"
        maze[*robot] = "."
        robot = new_pos
      end
    end

    maze.each_with_index.sum { |space, row, col| (space == "O") ? (row * 100) + col : 0 }
  end

  def part_two
    maze = Matrix[*@maze.to_a.map do |row|
      row.flat_map do |space|
        if space == "#"
          %w[# #]
        elsif space == "."
          %w[. .]
        elsif space == "O"
          %w([ ])
        else
          [space, "."]
        end
      end
    end]

    robot = Vector[*maze.index("@")]

    @moves.each do |move|
      direction = MOVES[move]
      new_pos = robot + direction
      new_space = maze[*new_pos]
      if new_space == "#"
        next
      elsif new_space == "."
        maze[*new_pos] = "@"
        maze[*robot] = "."
        robot = new_pos
      elsif new_space == "[" || new_space == "]" && can_move?(maze, new_pos, direction)

      end
    end

    maze.each_with_index.sum { |space, row, col| (space == "[") ? (row * 100) + col : 0 }
  end

  def can_move?(maze, new_position, difference)
    new_space = maze[*new_position]
    if new_space == "#"
      false
    elsif new_space == "."
      true
    else
      can_move?(maze, new_position + difference, difference, double)
    end
  end

  def trace_os(maze, start_position, direction)
    positions = Set.new([start_position])
    new_position = start_position + direction
    while maze[*new_position] == "O"
      positions.add(new_position)
      new_position += direction
    end
    positions
  end
end
