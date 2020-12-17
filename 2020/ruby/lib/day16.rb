# frozen_string_literal: true

require "pp"
require "set"

class Day16
  def initialize(ticket_notes_file)
    note_blocks = File.readlines(ticket_notes_file, "\n\n", chomp: true)
    @rules = note_blocks[0].lines(chomp: true).each_with_object({}) do |line, hash|
      key, range_decl = line.split(": ")
      values = range_decl.split(" or ").each_with_object(Set.new) do |range, set|
        lhs, rhs = range.split("-").map(&:to_i)
        set.merge(lhs..rhs)
      end
      hash[key] = values
    end
    @all_number_rules = @rules.values.reduce(:merge)
    @ticket = note_blocks[1].lines(chomp: true).last.split(",").map(&:to_i)
    @nearby_tickets = note_blocks[2].lines(chomp: true).slice(1..).map { _1.split(",").map(&:to_i) }
  end

  def part_1
    @nearby_tickets.flat_map { |ticket| ticket.reject { |v| @all_number_rules.include?(v) } }.sum
  end

  def part_2
    valid_tickets = @nearby_tickets.select { |ticket| ticket.all? { |v| @all_number_rules.include?(v) } }.transpose
    p valid_tickets

    rule_options = Hash.new { |h, k| h[k] = [] }
    valid_tickets.each_with_index do |col, idx|
      @rules.each do |rule_name, rule_range|
        rule_options[idx].append(rule_name) if col.all? { |n| rule_range.include?(n) }
      end
    end

    pp rule_options

    final_rules = {}
    until rule_options.empty?
      idx, rule_opts = rule_options.find { |_, v| v.difference(final_rules.keys).size == 1 }
      final_rules[rule_opts.difference(final_rules.keys)[0]] = idx
      rule_options.delete(idx)
      p final_rules
    end

    final_rules.keys.lazy.select { _1.start_with?("departure") }.map { final_rules[_1] }.sum
  end
end
