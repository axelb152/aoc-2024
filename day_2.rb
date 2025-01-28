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
      safe = check_safety(data)

      @safe_reports_count +=1 if safe
    end

    puts "Total count of safe reports is #{@safe_reports_count}"
  end

  def part_two
    @safe_reports_count = 0

    @input.each do |line|
        data = line.split.map(&:to_i)
        safe = check_safety(data)

        unless safe
          safe = check_with_dampener(data)
        end
      @safe_reports_count +=1 if safe
    end

    puts "Total count of safe reports after problem dampener is #{@safe_reports_count}"
  end

  private

  def check_safety(data)
    increasing = data.each_cons(2).all? { |a, b| a < b }
    decreasing = data.each_cons(2).all? { |a, b| a > b }

    if increasing || decreasing
      data.each_cons(2) do |a, b|
        diff = (a - b).abs
        return false unless diff.between?(1, 3)
      end
      true
    else
      false
    end
  end

  def check_with_dampener(data)
    data.each_with_index do |_, index|
      temp_data = remove_element_by_index(data, index)
      return true if check_safety(temp_data)
    end
    false
  end

  def remove_element_by_index(array, index)
    array.dup.tap { |copy| copy.delete_at(index) }
  end
end

DayTwo.new.part_one
DayTwo.new.part_two