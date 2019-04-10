# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is `20`, the result should be `98`
# (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# ANSWER
# ======
# Problem:
#   input: integer
#   output: integer
#   rules:
#     - assume number passed in is an integer greater than 1
#     - do not duplicate a multiple if it is a multiple of both 3 and 5
#   mental model:  write a method that takes in an integer greater than 1
#     and obtains all of the multiples of 3 and 5 that are between 1 and
#     the provided integer, and return the sum of those multiples.
# Examples:
#   multisum(3) == 3
#   multisum(5) == 8
#   multisum(10) == 33
#   multisum(1000) == 234168
# Data structures:
#   - an array to store the multiples of 3 and 5
# Algorithm 1:
#   - provided `num` as argument...
#   - instantiate `multiples` set to `[]`
#   - instantiate `counter`, set to `1`
#   - while `counter` <= `num`
#     - push `counter` into `multiples` if `counter` is evenly divisible by `3`
#       or if `counter` is evenly divisible by `5`
#   - sum up all items in `multiples` and return
# Code:

def multisum(num)
  multiples = []
  counter = 1

  loop do
    break if counter > num

    multiples << counter if counter % 3 == 0 || counter % 5 == 0

    counter += 1
  end

  counter = 0
  sum = 0
  loop do
    break if counter == multiples.length

    sum += multiples[counter]
    counter += 1
  end

  sum
end

p  multisum(1) == 0
p  multisum(3) == 3
p  multisum(5) == 8
p  multisum(10) == 33
p  multisum(20) == 98
p  multisum(1000) == 234168

# Concise version
def multiples_sum(arg)
  (0..arg).reduce { |sum, num| num % 3 == 0 || num % 5 == 0 ? sum + num : sum }
end

p '-- concise version'
p multiples_sum(1) == 0
p multiples_sum(3) == 3
p multiples_sum(5) == 8
p multiples_sum(10) == 33
p multiples_sum(20) == 98
p multiples_sum(1000) == 234168
