# frozen_string_literal: true

class Day2
  def initialize(levels_file)
    @reports = File.readlines(levels_file).map { _1.split.map(&:to_i) }
  end

  def part_one
    @reports.count { valid_report?(_1) }
  end

  def part_two
    @reports.count do |report|
      next true if valid_report?(report)

      differences = report.each_cons(2).map { _1.reduce(:-) }
      next false if differences.count { _1 > 3 || _1 < -3 || _1 == 0 } > 1

      valid = false
      0.upto(report.length - 1) do |i|
        without = report.dup
        without.delete_at(i)
        if valid_report?(without)
          valid = true
          break
        end
      end

      valid
    end
  end

  def valid_report?(report)
    differences = report.each_cons(2).map { _1.reduce(:-) }
    differences.all?(-3..-1) || differences.all?(1..3)
  end
end
