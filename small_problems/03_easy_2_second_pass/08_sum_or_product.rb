# PROBLEM
# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.
# mental model: iterate from 1 to an entered integer, accumulating its product
#  or sum (depending on what the user chooses).  Output the result
# assumptions: no zeros are input, no validation checks

# EXAMPLES
# >> Please enter an integer greater than 0: 5
# >> Enter 's' to compute the sum, 'p' to compute the product.  s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0: 6
# >> Enter 's' to compute the sum, 'p' to compute the product.  p
# The product of the integers between 1 and 6 is 720.

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE: 13:14
# STARTED:  13:06
# DURATION: 8m

def sum(number)
  result = 0

  loop do
    result += number

    break if number == 1
    number -= 1
  end

  result
end

def product(number)
  result = 1

  loop do
    result *= number

    break if number == 1
    number -= 1
  end

  result
end

puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product. "
operation = gets.chomp

result =
  if operation == "s"
    sum(number)
  else
    product(number)
  end

puts "The sum of the integers between 1 and #{number} is #{result}."

puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED: 13:14
# DURATION:

puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product. "
operation = gets.chomp

result =
  if operation == "s"
    (0..number).to_a.reduce{ |x, sum| sum + x }
  else
    (1..number).to_a.reduce{ |x, sum| sum * x }
  end

puts "The sum of the integers between 1 and #{number} is #{result}."
