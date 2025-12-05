# frozen_string_literal: true

def day_5_part_1(database)
  ranges_section, ingredients_list = database.split("\n\n")
  ranges = ranges_section.each_line(chomp: true).map { it.split("-").map(&:to_i) }
  ingredients = ingredients_list.lines(chomp: true).map(&:to_i)
  ingredients.count do |ingredient|
    ranges.find { |low, high| ingredient.between?(low, high) }
  end
end
