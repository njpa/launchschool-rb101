# PROBLEM
# =======

# Write a method that takes one argument, a positive integer, and returns
# the sum of its digits.

# Examples:
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# The tests above should print `true`.

# For a challenge, try writing this without any basic looping constructs
# (`while`, `until`, `loop`, and `each`).

# ANSWER
# ======

# Problem
# -------
# input: one integer
# output: one integer (sum of digits of input integer)
# explicit requirements:
# - method returns sum of digits or argument provided
# - cannot use `while`, `until`, `each`
# implicit requirements: none
# clarifying questions: none

# Examples
# --------
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# Data Structures
# ---------------
# We'll probably use an array in the method to store the digits

# Algorithm
# ---------
# 1. given an integer
# 2. instantiate an variable `digits` and set it to reference `[]`
# 3. instantiate an variable `sum` and set it to reference `0`
# 4. [subprocess] obtain digits from integer and store in `digits`
#     invoke `Integer#digits` on the argument and reassign `digits`
#     to reference the invocation's return value
# 5. [subprocess] sum up digits and store in `sum`
#     invoke `Array#sum` on `digits` and reassign `sum` to reference
#     the return value of the invocation
# 6. return `sum`

# Code
# ----
# Here is an implementation closely matching the algorithm
def sum(num)
  digits = []
  sum = 0
  digits = num.digits
  sum = digits.sum
  return sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Let's refactor that to the following:

def sum(num)
  num.digits.sum
end

puts '---------'
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# For a challenge, let's assume we're running on Ruby 2.2, which doesn't
# have `Integer#digits` in its Core API.

# Algorithm
# ---------
# 1. given the integer
# 2. instantiate variable `str_num` and set it to reference `''`
# 3. instantiate variable `digits` and set it to reference `[]`
# 4. instantiate variable `sum` and set it to reference `0`
# 5. [subprocess] store string version of provided integer in `str_num`
# 6. [subprocess] store letters of `str_num` in `digits` as numbers
# 7. [subprocess] add up all elements in `digits` and store in `sum`
# 8. return `sum`

def sum_by_map(num)
  digits = num.to_s.split('')
  digits.map! { |digit| digit.to_i }
  digits.sum
end

puts '---------'
puts sum_by_map(23) == 5
puts sum_by_map(496) == 19
puts sum_by_map(123_456_789) == 45

def sum_by_reduce(num)
  num.to_s.chars.map(&:to_i).reduce { |sum, digit| sum + digit }
end

puts '---------'
puts sum_by_reduce(23) == 5
puts sum_by_reduce(496) == 19
puts sum_by_reduce(123_456_789) == 45
