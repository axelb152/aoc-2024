# Pseudocode:

# create some regex to extract:
# mul(
# two integers (1-3 digits)
# end with )

# we need to find all substrings matching the pattern mul(X,Y)
# ensuring that X and Y are purely numeric

# Convert extracted X and Y to integers.
# Multiply them together.
# Sum all the results.

class DayThree

    def initialize
      @input = File.read('d3_input.txt').split("\n")
      @pattern = /mul\((\d{1,3}),(\d{1,3})\)/
    end

    def part_one
      result = @input.join.scan(@pattern).map { |x, y| x.to_i * y.to_i }.sum

      puts result
    end
end

DayThree.new.part_one