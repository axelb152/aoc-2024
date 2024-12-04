class PartOne
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

  def run
    total_distance = 0
    @list1.each_with_index do |item1, index|
      item2 = @list2[index]
      total_distance += (item1 - item2).abs
    end
    puts "part one: total distance: #{total_distance}"
  end
end

PartOne.new.run