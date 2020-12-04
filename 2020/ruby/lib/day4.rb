# frozen_string_literal: true

require "set"

class Day4
  ESSENTIAL_FIELDS = Set.new(%w[byr iyr eyr hgt hcl ecl pid]).freeze
  ALL_FIELDS = Set.new([*ESSENTIAL_FIELDS, "cid"]).freeze
  EYE_COLOURS = %w[amb blu brn gry grn hzl oth].freeze
  VALIDATORS = {
    "byr" => ->(byr) { byr.to_i.between?(1920, 2002) },
    "iyr" => ->(iyr) { iyr.to_i.between?(2010, 2020) },
    "eyr" => ->(eyr) { eyr.to_i.between?(2020, 2030) },
    "hcl" => ->(hcl) { hcl.match?(/\A#[0-9a-f]{6}\Z/) },
    "ecl" => ->(ecl) { EYE_COLOURS.include?(ecl) },
    "pid" => ->(pid) { pid.match?(/\A\d{9}\Z/) },
    "cid" => ->(_) { true },
  }

  def initialize(passports)
    @passports = File.read(passports).split("\n\n").map do |passport|
      passport.tr("\n", " ").split(" ").each_with_object({}) do |pair, hash|
        key, value = pair.split(":")
        hash[key] = value
      end
    end

    VALIDATORS["hgt"] = method(:height_validator)
  end

  def part_1
    @passports.count { |passport| ESSENTIAL_FIELDS.subset?(passport.keys.to_set) }
  end

  def part_2
    @passports.count do |passport|
      ESSENTIAL_FIELDS.subset?(passport.keys.to_set) &&
        passport.all? { |key, value| VALIDATORS[key].call(value) }
    end
  end

  private

  def height_validator(height)
    matched = height.match(/(?<num>\d+)(?<unit>cm|in)/)
    return false unless matched
    unit, num = matched["unit"], matched["num"].to_i
    if unit == "cm"
      num.between?(150, 193)
    elsif unit == "in"
      num.between?(59, 76)
    else
      false
    end
  end
end
