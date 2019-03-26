# PROBLEM
# =======

# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be
# empty and the numbers will always be positive integers.
# Examples:

# puts average([1, 5, 87, 45, 8, 8]) == 25 # => true
# puts average([9, 47, 23, 95, 16, 52]) == 40 # => true

# ANSWER
# ======

# Problem:
# -------
# input: array containing integer elements
# output: integer (representing average of all numbers in array
# explicit requirements:
# - array will never be empty
# - numbers will always be positive integers
# clarifying questions:
#   Q: will return value be integer and no floats
#   A: we'll assume yes, so we will perform integer division
# mental model:  write a method that takes an array of positive integers
#   and calculates the average of the integers and returns it.

# Example:
# -------
# puts average([1, 2]) == 1 # => true
# puts average([9, 47, 23, 95, 16, 52]) == 40 # => true

# Data structures
# ---------------
# array of integers as input; arrays in the method body, return an integer

# Algorithm
# ---------
# 1. given an array of integers
# 2. instantiate a variable sum and set it to reference `0`
# 3. add up all of the elements of the array and store as `sum`
# 4. return the result of dividing `sum` by the size of the given array

# Code
# ----
def average(arr)
  arr.sum / arr.length
end


puts average([1, 2]) == 1 # => true
puts average([9, 47, 23, 95, 16, 52]) == 40 # => true

def average_reduce(arr)
  sum = arr.reduce { |sum, x| sum + x }
  sum / arr.length
end

puts average_reduce([1, 2]) == 1 # => true
puts average_reduce([9, 47, 23, 95, 16, 52]) == 40 # => true

# Further Exploration
# ===================
# output is a float instead of an integer
# Q: for testing's sake, can we round the float to 2 decimal places?
# A: we'll assume you can.

def average_float(arr)
  sum = arr.reduce { |sum, x| sum + x }
  avg = sum.to_f / arr.length
  avg.round(2)
end

puts average_float([1, 2]) == 1.5 # => true
puts average_float([9, 47, 23, 95, 16, 52]) == 40.33 # => true
