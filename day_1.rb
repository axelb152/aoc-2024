require 'pry'
class DayOne
  def initialize
    @input = File.read('d1_input.txt').split("\n")

    @list1 = []
    @list2 = []

    @input.each do |line|
      data = line.split.map(&:to_i)
      @list1 << data[0]
      @list2 << data[1]
    end

    # Sort both lists
    @list1.sort!
    @list2.sort!
  end

  def part_one
    total_distance = 0
    @list1.each_with_index do |item1, index|
      item2 = @list2[index]
      total_distance += (item1 - item2).abs
    end
    puts "part one: total distance: #{total_distance}"
  end

  def part_two
    total_similarity = 0
    @list1.each do |item1|
      @list2.each do |item2|
        if item1 == item2
          total_similarity += item1 * 1
        end
      end
    end
    puts "part two: total similarity: #{total_similarity}"
  end
end

DayOne.new.part_one
DayOne.new.part_two