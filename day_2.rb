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