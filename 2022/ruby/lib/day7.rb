# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

class Node
  extend T::Sig

  sig { returns(String) }
  attr_reader :name
  sig { returns(T::Array[Node]) }
  attr_reader :children

  attr_accessor :parent, :size, :file

  sig { params(name: String).void }
  def initialize(name:)
    @name = name
    @file = false
    @size = 0
    @parent = nil
    @children = T.let([], T::Array[Node])
  end

  sig { params(line: String).returns(T.attached_class) }
  def self.from_line(line)
    item, name = line.split
    node = new(name: T.must(name))

    T.must(item).match(/\d+/) do
      node.size = item.to_i
      node.file = true
    end

    node
  end

  sig { returns(T::Boolean) }
  def dir?
    !file
  end

  sig { params(node: Node).returns(T.self_type) }
  def insert(node)
    return node unless dir?

    node.parent = self
    @children.push(node)
    @size += node.size
    parent.size += @size if parent

    self
  end

  sig { params(indent_level: Integer).void }
  def pretty_print(indent_level = 0)
    puts("#{" " * indent_level}- #{@name} (#{dir? ? "dir" : "file"}, size=#{@size})")
    @children.each { |child| child.pretty_print(indent_level + 2) }
    nil
  end

  sig do
    params(
      check: T.proc.params(arg0: Node).returns(T::Boolean),
      dirs: T::Array[Integer]
    ).returns(T::Array[Integer])
  end
  def collect_children(check, dirs = [])
    if dir?
      dirs.push(size) if check.call(self)
      children.each_with_object(dirs) { |child, arr| child.collect_children(check, arr) }
    else
      dirs
    end
  end
end

class Day7
  extend T::Sig

  DEVICE_STORAGE = 70_000_000
  NEEDED_STORAGE = 30_000_000

  sig { params(command_file: String).void }
  def initialize(command_file)
    @command_lines = T.must(File.readlines(command_file, chomp: true).slice(1..))

    @root_node = Node.new(name: "/")

    node = @root_node
    @command_lines.each do |line|
      next if line == "$ ls"

      if line == "$ cd .."
        node = T.cast(node.parent, Node)
        node.size = node.children.sum(&:size)
        next
      elsif line.start_with?("$ cd")
        _, _, dir_name = line.split
        if (child = node.children.find { _1.name == dir_name })
          node = T.must(child)
        else
          new_node = Node.new(name: T.must(dir_name))
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
    @root_node.collect_children(-> (node) { node.size <= 100_000 }).sum
  end

  def part_two
    free_space = DEVICE_STORAGE - @root_node.size
    min_size_to_remove = NEEDED_STORAGE - free_space
    @root_node.collect_children(-> (node) { node.size > min_size_to_remove }).min
  end
end
