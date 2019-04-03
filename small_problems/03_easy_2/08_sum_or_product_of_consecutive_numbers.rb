# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# ANSWER
# ======

# input: integer, string
# output: integer
# rules:
# - if 'p' entered, return product of all numbers between 1 and the integer
# - if 's' entered, return sum of numbers between 1 and the integer
# - range inclusive integer (implicit)
# questions:
# - input validation?  We'll assume not required
# - use iterators?  We'll assume you can
# examples:
#   - given '6' and 'p', output is '720'
#   - given '5' and 's', output is '15'
# data structures: arrays
# algorithm:
# - obtain integer, store in `ceiling`
# - obtain string, store in `operator`
# - get all numbers between 1 and integer, store in `numbers`
# - instantiate `result`, set to reference `0`
# - if `operator` == `'s'`
#     get sum of all integers, store in result
#   else
#     get product of all integers, store in result
# - outputs interpolated string with `ceiling` and `result`
# Code:

puts ">> Please enter an integer greater than 0:"
ceiling = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

if operator == 'p'
  result = (1..ceiling).reduce(&:*)
  operation = 'product'
else
  result = (1..ceiling).reduce(&:+)
  operation = 'sum'
end

puts "The #{operation} of the integers between 1 " \
     "and #{ceiling} is #{result}."
