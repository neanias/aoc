# frozen_string_literal: true

class Day5
  MappingEntry = Data.define(:dest_start, :source_start, :length) do
    def rrange = (dest_start...dest_start + length)

    def map(source)
      return nil unless (source_start...source_start + length).cover?(source)
      offset = source - source_start
      dest_start + offset
    end

    def rmap(dest)
      return nil unless (dest_start...dest_start + length).cover?(dest)
      offset = dest - dest_start
      source_start + offset
    end
  end

  def initialize(almanac_file)
    seeds_list, *mapping_blocks = File.read(almanac_file).split("\n\n")
    @seeds = seeds_list.split(": ")[1].split.map(&:to_i)
    @maps = mapping_blocks.map { process_mapping_block(_1) }
  end

  def part_one
    @seeds.map do |seed|
      @maps.reduce(seed) do |num, map|
        map.find { |entry| entry.map(num) }&.map(num) || num
      end
    end.min
  end

  def part_two
    # seed_pairs = @seeds.each_slice(2).map { |(start, len)| (start...start + len).to_a }.flatten
    minimum = Float::INFINITY
    @seeds.each_slice(2) do |(start, len)|
      len.times do |i|
        seed = start + i
        min = @maps.reduce(seed) do |num, map|
          map.find { |entry| entry.map(num) }&.map(num) || num
        end
        minimum = min if min < minimum
      end
    end
    minimum
  end

  def part_two_reverse
    smallest_range_defn = @seeds.each_slice(2).min
    smallest_range = (smallest_range_defn[0]...smallest_range_defn[0] + smallest_range_defn[1])
    smallest_location_range = maps.last.min_by(&:dest_start)
    smallest_location_range.rrange.find do |location|
      start = @maps.reverse.reduce(location) do |num, map|
        map.find { |entry| entry.rmap(num) }&.rmap(num) || num
      end
      smallest_range.cover?(start)
    end
  end

  private

  def process_mapping_block(block)
    _, *ranges = block.split("\n")
    ranges.map { MappingEntry.new(*_1.split.map(&:to_i)) }
  end
end
