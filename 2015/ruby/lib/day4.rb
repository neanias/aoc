# frozen_string_literal: true

require "digest"

class Day4
  def initialize(secret_key)
    @secret_key = secret_key
  end

  def part_one
    tag = 1

    until Digest::MD5.hexdigest("#{@secret_key}#{tag}").start_with?("00000")
      tag += 1
    end

    tag
  end

  def part_two
    tag = 1

    until Digest::MD5.hexdigest("#{@secret_key}#{tag}").start_with?("000000")
      tag += 1
    end

    tag
  end
end
