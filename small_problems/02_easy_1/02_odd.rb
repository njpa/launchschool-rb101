# PROBLEM
# =======
# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns `true` if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

# Examples:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# ANSWER
# ======
# Understand the problem
# ----------------------
# input: integer
# output: boolean
# explicit rules:
# - can take positive, negative, zero
# - argument is a valid integer
# - cannot use `#odd?` or `#even?` methods
# implicit rules;
# - none
# Mental model:  write a method that takes any integer and returns `true`
# if it is an odd number without using `#odd?` or `#even?` methods.
# Tests:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# Data structure:  boolean
# Algorithm:
# 1) obtain remainder of dividing number by `2`
# 2) if remainder is equal to 1, the return `true`, if not, return `false`

def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false

# FURTHER EXPLORATION
# ===================
# Rewrite the method without using the modulo operator `%`.  Use
# `Integer#remainder` instead.

# ANSWER
# ======
# Invoking `#remainder` on an integer returns the remainder of dividing
# the caller by the argument supplied.  The method returns negative
# values if the caller is negative.  So, in order to use it, we will
# have to take into consideration that the 'modulus' can be `-1` as well
# as `1`.

# Algorithm:
# 1) obtain remainder of dividing number by `2`
# 2) if remainder is equal to `1` or `-1`, the return `true`,
#    if not, return `false`

def odd_number?(num)
  num.remainder(2) != 0
end

puts odd_number?(2)    # => false
puts odd_number?(5)    # => true
puts odd_number?(-17)  # => true
puts odd_number?(-8)   # => false
puts odd_number?(0)    # => false
