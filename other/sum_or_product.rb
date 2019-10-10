=begin

Write a program that asks the user to enter an integer greater
than `0`, then asks if the user wants to determine the sum or
product of all numbers between `1` and the entered integer.c

Examples:
>> Please enter an integer greater than 0:
5
Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15

>> Please enter an integer greater than 0:
6
Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720

PEDAC
=====
int -> string -> int
- will loop from 1 to int (inclusive) and return
  sum of all numbers if string == `s`
  product of all numbers if string == `p`
- 's' means
questions:
- do we need to validate input? No
- can we use `reduce`? Yes

TIME
====
started pedac at 22:49
started coding at 22:51
working solution at 23:27

=end


puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product:"
operation = gets.chomp

def reduce(number, operation)
  res = 1
  counter = 1

  loop do
    break if counter == number

    counter += 1
    res += counter if operation == 's'
    res *= counter if operation == 'p'
  end

  res
end

operation_string = operation == 's' ? 'sum' : 'product'
puts "The #{operation_string} of the integers between " +
     "1 and #{int} is #{reduce(int, operation)}"

# REFACTOR

puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product:"
operation = gets.chomp

res = if operation == 's'
        (1..int).reduce(:+)
      else
        (1..int).reduce(:*)
      end

operation_string = operation == 's' ? 'sum' : 'product'

puts '-- refactor'
puts "The #{operation_string} of the integers between " +
     "1 and #{int} is #{res}"



