# frozen_string_literal: true

class Day9
  def initialize(disk_map_file)
    @disk_map = File.read(disk_map_file, chomp: true).chars.map(&:to_i)
    @files = @disk_map[(0..).step(2)]
    @free = @disk_map[(1..).step(2)]
  end

  def part_one
    disk = []
    counter = 0
    @disk_map.each_with_index do |num, i|
      disk.push([i.even? ? counter : ".", num])
      counter += 1 if i.even?
    end

    until disk.all? { _1[0].is_a?(Integer) }
      item, count = disk.pop
      next if item == "."

      free_space_idx = disk.index { _1[0] == "." }
      break if free_space_idx.nil?
      _, free_space = disk[free_space_idx]

      if free_space > count
        disk.insert(free_space_idx, [item, count])
        disk[free_space_idx + 1] = [".", free_space - count]
      elsif free_space < count
        disk[free_space_idx] = [item, free_space]
        disk.push([item, count - free_space])
      else
        disk[free_space_idx] = [item, count]
      end
    end

    disk.flat_map { |(num, count)| [num] * count }.each_with_index.sum { |el, i| el * i }
  end

  def part_two
    disk = []
    counter = 0
    @disk_map.each_with_index do |num, i|
      disk.push((i.even? ? [counter, num] : [".", num]))
      counter += 1 if i.even?
    end

    disk_copy = disk.dup

    until disk_copy.empty?
      item, count = disk_copy.pop
      next if item == "." || item == 0

      free_space_idx = disk.index { _1[0] == "." && _1[1] >= count }
      next if free_space_idx.nil?
      _, free_space = disk[free_space_idx]

      if free_space > count
        disk.insert(free_space_idx, [item, count])
        disk[free_space_idx + 1] = [".", free_space - count]
      else
        disk[free_space_idx] = [item, count]
      end

      rindex = disk.rindex([item, count])
      disk[rindex] = [".", count]
    end

    disk.flat_map { |(el, count)| [el] * count }.each_with_index.sum { |el, i| (el == ".") ? 0 : el * i }
  end
end
