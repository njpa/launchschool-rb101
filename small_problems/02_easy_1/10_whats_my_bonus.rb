# PROBLEM
# =======

# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is `true`, the
# bonus should be half of the salary. If the boolean is `false`, the bonus
# should be 0.

# Examples:
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# The tests above should print `true`.

# ANSWER
# ======
# input: positive integer and a boolean
# output: integer
# explicit requirements:
# - if boolean `false`, return `0`
# - if boolean `true`, return half of first argument
# questions:
# Q: should the method return floats?
# A: we will assume not.
# mental model: problem definition is clear enough.
# examples:
#   puts calculate_bonus(1000, false) == 0 # => true
#   puts calculate_bonus(50000, true) == 25000 # => true
#   puts calculate_bonus(3, true) == 1 # => true
# data structures: the method will probably only use integers
# algorithm:
# 1. given the salary and the boolean
# 2. if boolean is true
#      return salary / 2
#    else
#      return 0
# code:

def calculate_bonus(salary, elegible)
  elegible ? salary / 2 : 0
end

puts calculate_bonus(1000, false) == 0 # => true
puts calculate_bonus(50000, true) == 25000 # => true
puts calculate_bonus(3, true) == 1 # => true
