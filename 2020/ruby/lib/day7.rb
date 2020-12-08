# frozen_string_literal: true

require "set"

class Day7
  SHINY_GOLD = "shiny gold".freeze

  def initialize(bag_rules)
    @bag_rules = File.readlines(bag_rules, chomp: true).each_with_object({}) do |rule, hash|
      key, rest = rule.split(" bags contain ")
      hash[key] = rest.split(", ").each_with_object({}) do |bags, tree|
        next if bags.start_with?("no")
        number, adjective, colour, _ = bags.split
        tree["#{adjective} #{colour}"] = number.to_i
      end
    end
  end

  # This could probably be simplified now
  def part_1
    shiny_gold = Set.new([SHINY_GOLD])
    growing = true
    size = shiny_gold.size

    while growing
      @bag_rules.each do |key, bags|
        shiny_gold.add(key) if bags.keys.to_set.intersect?(shiny_gold)
      end
      growing = size != shiny_gold.size
      size = shiny_gold.size
    end

    shiny_gold.size - 1
  end

  def part_2
    dig(SHINY_GOLD)
  end

  private

  def dig(key)
    return 0 if @bag_rules[key].empty?
    @bag_rules[key].sum do |k, v|
      v + v * dig(k)
    end
  end
end
