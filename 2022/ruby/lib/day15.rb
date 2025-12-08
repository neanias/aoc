# typed: true
# frozen_string_literal: true

require "csv"
require "matrix"
require "set"

class Day15
  def initialize(sensors_file)
    @sensors_with_beacons = File.readlines(sensors_file, chomp: true).map do |line|
      line.split(": ").map do |part|
        Vector[
          *CSV.parse(
            part.split("at ")[-1],
            row_sep: ", ",
            col_sep: "=",
            converters: :integer
          ).transpose.last
        ]
      end
    end
    @beacons = @sensors_with_beacons.transpose.last.to_set
  end
end
