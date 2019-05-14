# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and
# 5, print "FizzBuzz".

# Example:

# fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# ANSWER
# ======
# Problem:
# input: integer, integer
# output: output
# rules:
# - output numbers between two integers
# - if a number is divisible by 3, output "Fizz"
# - if divisible by 5, output "Buzz"
# - if divisible by both, output "FizzBuzz"
# - includes first number and last number
# Example:
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
# Data structure:
# - none assumed
# Algorithm:
# - given `start` and `end`
# - while `start` is less than `end`
#   - if `start` is divisible by 3 and 5, output "FizzBuzz"
#   - if `start` is divisible by 5, output "Buzz"
#   - if `start` is divisible by 3, output "Fizz"
#   - increment `start` by `1`

def fizzbuzz(start, finish)
  while start <= finish
    if start % 5 == 0 and start % 3 == 0
      puts "FizzBuzz"
    elsif start % 5 == 0
      puts "Buzz"
    elsif start % 3 == 0
      puts "Fizz"
    else
      puts start
    end

    start += 1
  end
end

fizzbuzz(1, 15)
 #-> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
