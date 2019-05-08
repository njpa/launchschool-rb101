# PROBLEM
# =======
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent
# number is the sum of the two previous numbers. This series appears
# throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the
# results grow at an incredibly rapid rate. For example, the 100th Fibonacci
# number is 354,224,848,179,261,915,075 -- that's enormous, especially
# considering that it takes 6 iterations before it generates the first 2 digit
# number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

# Examples:

# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# You may assume that the argument is always greater than or equal to 2.

# ANSWER
# ======
# in: integer
# out: integer
# rules:
# - return value is index of first Fibonacci number having the number of digits
#   specified in the argument
# - first Fibonacci number has index `1`, not `0`
# - in Fibonacci series, first two numbers are `1` by definition
# - we assume argument is always greater than or equal to 2
# examples:
# fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# fibonacci_index_by_length(10) == 45
# fibonacci_index_by_length(100) == 476
# fibonacci_index_by_length(1000) == 4782
# fibonacci_index_by_length(10000) == 47847
# data structures:
# - an array to store the fibonnaci series
# algorithm:
# - given `number_digits`
# - instantiate `series` and set to [1, 1, 2, 3, 5, 8, 13]
# - instantiate `current_index` and set to `7`
# - while `number_digits` is unequal to the number of
#   digits in `series[current_index]`
#   - push into `series` `series[-1] + series[-2]`
#   - increment `current_index` by `1`
# - return `current_index`
# code:

def fibonacci_index_by_length(number_digits)
  series = [1, 1, 2, 3, 5, 8, 13]
  current_index = 7

  while number_digits != series[current_index - 1].digits.size
    series << (series[-1] + series[-2])
    current_index += 1
  end

  current_index
end

p fibonacci_index_by_length(2)  == 7          # 1 1 2 3 5 8 13
p fibonacci_index_by_length(3)  == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p fibonacci_index_by_length(10)  == 45
p fibonacci_index_by_length(100)  == 476
p fibonacci_index_by_length(1000)  == 4782
#p fibonacci_index_by_length(10000) == 47847 # -> computer hangs

# ALTERATIVES
# ===========
# We don't necessarily need a data structure to solve this problem since we
# do not need to return a data structure, or perform any logic on a data
# structure.  We simply need to keep track of an index that increments on
# every loop.

def find_fibonacci_index_by_length(number_digits)
  penultimate = 1
  last = 1
  fibonacci = 2
  index = 3

  loop do
    break if number_digits <= fibonacci.digits.size

    penultimate, last, fibonacci = last, fibonacci, fibonacci + last
    index += 1
  end

  index
end

puts '-- No data structures'
p find_fibonacci_index_by_length(2)  == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10)  == 45
p find_fibonacci_index_by_length(100)  == 476
p find_fibonacci_index_by_length(1000)  == 4782
p fibonacci_index_by_length(10000) == 47847 # -> computer hangs
