# Pseudocode:

# Initialize count of safe reports to 0

# For each report in the input data:
#     Split the report into a list of numbers
#     Determine if the list is strictly increasing or strictly decreasing
#     For each pair of adjacent numbers:
#         Calculate the difference
#         Check if the difference is between 1 and 3
#         If not, mark the report as unsafe and break
#     If the report remains marked as safe after all checks:
#         Increment the safe reports count

# Output the total count of safe reports


require 'pry'
class DayTwo
  def initialize
    @input = File.read('d2_example_input.txt').split("\n")

    @safe_reports_count = 0
  end

  def part_one
    @input.each do |line|
      data = line.split.map(&:to_i)
      safe = true

      increasing = data.each_cons(2).all? { |a, b| a < b }
      decreasing = data.each_cons(2).all? { |a, b| a > b }

      if increasing || decreasing
        data.each_cons(2) do |a, b|
          diff = (a - b).abs
          unless diff.between?(1, 3)
            safe = false
            break
          end
        end
      else
        safe = false
      end

      @safe_reports_count +=1 if safe
    end

    puts "Total count of safe reports is #{@safe_reports_count}"
  end
end

DayTwo.new.part_one