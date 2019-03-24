# PROBLEM
# =======

# Write a method that takes one argument, a positive integer, and returns a
# list of the digits in the number.

# Examples:
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# ANSWER
# ======

# Understanding the problem
# -------------------------
# input: positive integer
# output: array of integers
# Rules
# -----
# Explicit: assuming the argument is always a positive integer
# Implicit: none
# Clarifying questions:
# Q: How should we hande `0`?
# A: Well assume that it should print out and empty string `[]`.

# Algorithm
# ---------
# 1) given a positive integer `num`
# 2) instantiate empty array `nums`
# 3) instantiate `divisor` equal to `1`
# 4) instandiate `modulo` equal to `10`
# 4) if `num` / `divisor` <= 0
#    - unshift `number / divisor % modulo`
#    else
#      reassign divisor *= 10
#      if `num` / `divisor` <= 0
#      - unshift `number / divisor % modulo`
#      else
#        ...and so on and so forth...

# while `num / divisor` > 0
#  unshift `number  / divisor % modulo`
#  divisor *= 10

def digit_list(num)
  nums = []
  divisor = 1
  loop do
    break if num / divisor <= 0
    nums.unshift(num / divisor % 10)
    divisor *= 10
  end
  nums
end

puts digit_list(7) == [7] # => true
puts digit_list(987654321) == [9, 8, 7, 6, 5, 4, 3, 2, 1] # => true


# ONE LINER
def digit_list_one_liner(num)
  num.digits.reverse
end

puts digit_list_one_liner(7) == [7] # => true
puts digit_list_one_liner(987654321) == [9, 8, 7, 6, 5, 4, 3, 2, 1] # => true
