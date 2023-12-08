# frozen_string_literal: true

class Day8
  def initialize(network_file)
    @route, tree = File.read(network_file).split("\n\n")
    @tree = tree.split("\n").each_with_object({}) do |line, hash|
      node, leaves = line.split(" = ")
      hash[node] = leaves.scan(/[A-Z]{3}/)
    end
  end

  def part_one
    calculate_path_length("AAA", ->(x) { x == "ZZZ" })
  end

  def part_two
    start_nodes = @tree.keys.select { _1.end_with?("A") }
    exit_condition = ->(x) { x.end_with?("Z") }
    start_nodes.map { calculate_path_length(_1, exit_condition) }.reduce(1, :lcm)
  end

  private

  def calculate_path_length(start_node, exit_condition)
    steps = 0
    current_node = start_node
    @route.chars.cycle do |inst|
      break if exit_condition.call(current_node)
      current_node = @tree[current_node][(inst == "L") ? 0 : 1]
      steps += 1
    end
    steps
  end
end
