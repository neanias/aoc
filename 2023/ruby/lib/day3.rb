# frozen_string_literal: true

class Day3
  def initialize(engine_schematic_file)
    @engine_schematic = File.readlines(engine_schematic_file, chomp: true)
  end

  def part_one
    total = 0
    @engine_schematic.each_with_index do |line, idx|
      numbers = line.to_enum(:scan, /\d+/).map { Regexp.last_match }
      numbers.each do |num|
        indices = (num.begin(0)...num.end(0)).map { [idx, _1] }
        should_add = indices.any? do |index_pair|
          neighbours(*index_pair)
            .reject { _1[0] >= @engine_schematic.size || _1[1] >= line.length }
            .any? { @engine_schematic[_1[0]][_1[1]].match?(/[^.0-9]/) }
        end
        if should_add
          total += num[0].to_i
        end
      end
    end

    total
  end

  def part_two
    coord_numbers = {}
    @engine_schematic.each_with_index do |line, idx|
      numbers = line.to_enum(:scan, /\d+/).map { Regexp.last_match }
      numbers.each do |num|
        # This is a ridiculous solution to adding a unique identifier for a number, but it works
        (num.begin(0)...num.end(0)).map { coord_numbers[[idx, _1]] = "#{num[0]}:#{idx},#{num.begin(0)}" }
      end
    end

    total = 0
    @engine_schematic.each_with_index do |line, idx|
      gears = line.to_enum(:scan, /\*/).map { Regexp.last_match }
      gears.each do |gear|
        numbers = neighbours(idx, gear.begin(0))
          .select { coord_numbers.key?(_1) }
          .map { coord_numbers[_1] }
          .uniq
          .map { _1.split(":")[0].to_i }
        total += numbers.reduce(:*) if numbers.length == 2
      end
    end

    total
  end

  private

  def neighbours(row, col)
    [
      [row + 1, col + 1],
      [row + 1, col - 1],
      [row + 1, col],
      [row - 1, col + 1],
      [row - 1, col - 1],
      [row - 1, col],
      [row, col + 1],
      [row, col - 1]
    ].map { |x, y| [x.clamp(0..), y.clamp(0..)] }
  end
end
