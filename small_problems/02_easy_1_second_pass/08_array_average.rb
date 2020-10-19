# PROBLEM
# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be
# empty and the numbers will always be positive integers. Your result should
# also be an integer.
# mental model: iterate through a list of numbers, accumulating a sum
#   into a variable, and then returning the quotient of the sum and
#   the number of elements in the list
# assumptions: no checking of objects in list, array never empty
#     numbers always positive integers
# EXAMPLES

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE: 13:15
# STARTED: 13:12
# DURATION: 2mins

def average(numbers)
  total = 0
  counter = 0

  loop do
    total += numbers[counter]
    counter += 1

    break if counter == numbers.size
  end
  total / numbers.size
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40

# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE: 13:17
# STARTED:  13:16
# DURATION: 1m

def average(numbers)
  numbers.reduce(:+) / numbers.count
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
