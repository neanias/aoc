# frozen_string_literal: true

class Day23
  def initialize(connections_file)
    @connections = File.readlines(connections_file, chomp: true).map { _1.split("-") }
  end

  def part_one
    parties = Set.new
    @connections.select { _1.start_with?("t") || _2.start_with?("t") }.each do |t_conn|
      t = t_conn.find { _1.start_with?("t") }
      other_node = t_conn.find { !_1.start_with?("t") }
      others = @connections.select { _1.include?(other_node) }
      next if others.empty?
      others = others.flatten.uniq.delete_if { _1 == other_node || _1 == t }
      next if others.empty?
      others.each { parties.add(Set.new([*t_conn, _1])) }
    end
    parties.size
  end
end
