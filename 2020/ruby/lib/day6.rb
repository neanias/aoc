# frozen_string_literal: true

require "set"

class Day6
  def initialize(decl_forms)
    @decl_forms = File.read(decl_forms).split("\n\n")
  end

  def part_1
    @decl_forms.sum do |decl_form|
      decl_form.split.each_with_object(Set.new) do |person, set|
        set.merge(person.chars)
      end.size
    end
  end

  def part_2
    @decl_forms.sum do |decl_form|
      people = decl_form.split
      answers = people.flat_map(&:chars).tally
      answers.count { |_, v| v == people.size }
    end
  end
end
