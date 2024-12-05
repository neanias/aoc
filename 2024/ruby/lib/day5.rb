# frozen_string_literal: true

class Day5
  def initialize(printing_file)
    rules, pages = File.read(printing_file).split("\n\n")
    @rules = rules.lines.map { |line| line.split("|").map(&:to_i) }
    @pages = pages.lines.map { |line| line.split(",").map(&:to_i) }
  end

  def part_one
    before_map = @rules.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(l, r), h| h[l] << r }
    correct_pages = @pages.select do |list|
      list.each_with_index.all? do |page, idx|
        before_map[page].all? do |other_page|
          other_page_index = list.index(other_page)
          next true if other_page_index.nil?
          other_page_index > idx
        end
      end
    end
    correct_pages.sum { _1[_1.length / 2] }
  end

  def part_two
    before_map = @rules.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(l, r), h| h[l] << r }
    incorrect_pages = @pages.reject do |list|
      list.each_with_index.all? do |page, idx|
        before_map[page].all? do |other_page|
          other_page_index = list.index(other_page)
          next true if other_page_index.nil?
          other_page_index > idx
        end
      end
    end

    incorrect_pages.map do |list|
      list.sort do |l, r|
        if before_map[l].include?(r)
          -1
        elsif l == r
          0
        else
          1
        end
      end
    end.sum { _1[_1.length / 2] }
  end
end
