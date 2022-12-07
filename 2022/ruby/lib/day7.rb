# typed: true
# frozen_string_literal: true

require "set"

class Node
  attr_reader :name, :children
  attr_accessor :parent
  attr_accessor :size
  attr_accessor :file

  def initialize(name:)
    @name = name
    @file = false
    @size = 0
    @parent = nil
    @children = []
  end

  def self.from_line(line)
    item, name = line.split
    node = new(name: name)

    item.match(/\d+/) do
      node.size = item.to_i
      node.file = true
    end

    node
  end

  def dir?
    !file
  end

  def insert(node)
    return unless dir?
    node.parent = self
    @children.push(node)
    @size += node.size
    parent.size += @size if parent
  end

  def pretty_print(indent_level = 0)
    puts "#{" " * indent_level}- #{@name} (#{dir? ? "dir" : "file"}, size=#{@size})"
    @children.each do |child|
      child.pretty_print(indent_level + 2)
    end
  end
end

class Day7
  DEVICE_STORAGE = 70_000_000
  NEEDED_STORAGE = 30_000_000

  def initialize(command_file)
    @command_lines = File.readlines(command_file, chomp: true).slice(1..)

    @root_node = Node.new(name: "/")

    node = @root_node
    @command_lines.each do |line|
      if line == "$ ls"
        next
      elsif line == "$ cd .."
        node = node.parent
        node.size = node.children.sum(&:size)
        next
      elsif line.start_with?("$ cd")
        _, _, dir_name = line.split
        if (child = node.children.find { _1.name == dir_name })
          node = child
        else
          new_node = Node.new(name: dir_name)
          node.insert(new_node)
          node = new_node
        end
        next
      end

      new_node = Node.from_line(line)
      node.insert(new_node)
    end

    # This is coming out wrong for some reason.
    # TODO: fix
    @root_node.size = @root_node.children.sum(&:size)
  end

  def part_one
    collect_children(@root_node, ->(node) { node.size <= 100_000 }).sum
  end

  def part_two
    free_space = DEVICE_STORAGE - @root_node.size
    min_size_to_remove = NEEDED_STORAGE - free_space
    collect_children(@root_node, ->(node) { node.size > min_size_to_remove }).min
  end

  private

  def collect_children(node, check, dirs = [])
    if node.dir?
      dirs.push(node.size) if check.call(node)
      node.children.reduce(dirs) { collect_children(_2, check, _1) }
    else
      dirs
    end
  end
end
