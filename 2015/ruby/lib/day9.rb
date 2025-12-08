# frozen_string_literal: true

class Day9
  def initialize(distances_file)
    distances_hash = Hash.new { |h, k| h[k] = {} }
    @distances = File.readlines(distances_file, chomp: true).each_with_object(distances_hash) do |line, hash|
      route, distance = line.split(" = ")
      distance = distance.to_i
      from, to = route.split(" to ")
      hash[from][to] = distance
      hash[to][from] = distance
    end
  end

  def part_one
    @distances.keys.map { |start| dijkstra(@distances, start) }
  end

  private

  def dijkstra(graph, start)
    distances = {}
    visited = {}
    nodes = graph.keys

    nodes.each { distances[_1] = Float::INFINITY }
    distances[start] = 0

    until nodes.empty?
      min_node = nil

      nodes.each do |node|
        if min_node.nil? || distances[node] < distances[min_node]
          min_node = node unless visited[node]
        end
      end

      break if distances[min_node] == Float::INFINITY

      graph[min_node].each do |neighbour, value|
        alt = distances[min_node] + value
        distances[neighbour] = alt if alt < distances[neighbour]
      end

      visited[min_node] = true
      nodes.delete(min_node)
    end

    distances
  end
end
