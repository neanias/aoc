# frozen_string_literal: true

class Day3
  def process_input(file)
    @paths = File.read(file).chomp.split("\n").map { |line| line.split(",") }
  end
end
