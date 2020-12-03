# frozen_string_literal: true

class Day2
  def initialize(passwords_file)
    @passwords = File.read(passwords_file)
  end

  def part_1
    @passwords.lines(chomp: true).count do |line|
      range, letter, password = line.split(" ")
      password_chars = password.chars.tally
      range = Range.new(*range.split("-").map(&:to_i))
      range.cover?(password_chars[letter[0]])
    end
  end

  def part_2
    @passwords.lines(chomp: true).count do |line|
      indices, letter, password = line.split(" ")
      password_pair = indices.split("-").map { |n| password[n.to_i - 1] }
      password_pair[0] != password_pair[1] &&
        ((password_pair[0] == letter[0]) ^ (password_pair[1] == letter[0]))
    end
  end
end
