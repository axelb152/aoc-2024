# Pseudocode:

# create some regex to extract:
# mul(
# two integers (1-3 digits)
# end with )

# we need to find all substrings matching the pattern mul(X,Y)
# ensuring that X and Y are purely numeric

### Part 1
# Convert extracted X and Y to integers.
# Multiply them together.
# Sum all the results.

### Part 2

require 'pry'
class DayThree

  def initialize
    @input = File.read('d3_example_input.txt').split("\n")
    @pattern = /mul\((\d{1,3}),(\d{1,3})\)/
    @pattern_do = /do\(\)/
    @pattern_dont = /don't\(\)/
    @corrupted_memory = @input.join # joins into one line string
  end

  def part_one
    result = @corrupted_memory.scan(@pattern).map { |x, y| x.to_i * y.to_i }.sum

    puts result
  end

  def part_two
    total_sum = 0
    enabled = true

    @input.join.scan(/#{@pattern}|#{@pattern_do}|#{@pattern_dont}/).each do |match|
      if match[0] # If it's a mul(X,Y)
        x, y = match[0].scan(/\d+/).map(&:to_i)
        total_sum += x * y if enabled
      elsif match[1] # If it's do()
        enabled = true
      elsif match[2] # If it's don't()
        enabled = false
      end
      total_sum
    end
    puts total_sum
  end
end

DayThree.new.part_one
DayThree.new.part_two