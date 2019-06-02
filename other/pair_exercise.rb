=begin

PROBLEM
=======

Write a program that asks the user to enter an integer greater than `0`,
then asks if the user wants to determine the sum or product of all
numbers between 1 and the entered integer.

Examples:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to comput the product:
s
The sum of integers between 1 and 5 is 15

ANSWER
======
integer -> string -> integer
rules:
- result is either sum or product of numbers between 1 and integer
questions
- what happens when use enters `1`
  - sum is `1`
  - product is `1`
- should input be validated? We'll assume not
examples:
  5 -> p -> 120
  5 -> s -> 15
  1 -> s -> 1
  1 -> p -> 1
data structures: possibly new array to hold numbers
algorithm:
- ask user for integer
- get integer and store in `integer`
- ask user for operation
- get integer and store in `operation`
- instantiate `result` and set to 0
- for every integer in integers
  if `operation` is `'p'`
    reassign `result` to `result` + `integer`
  else
    reassign `result` to `result` * `integer`
- output string with operation (as string), integer and
result interpolated

TIMING
======
started problem decomposition: 8:20
started coding: 8:26
stopped coding: 8:49
started refactoring: 8:50
stopped refactoring: 8:58
=end

puts ">> Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to comput the product:"
operation = gets.chomp

sum = 0
product = 1
count = 1

loop do
  sum += count if operation == 's'
  product *= count if operation == 'p'

  count += 1

  break if count > integer

end

case operation
when "s"
  operation_string = "sum"
  result = sum
when "p"
  operation_string = "product"
  result = product
end

puts "The #{operation_string} of integers between 1 and " +
     "#{integer} is #{result}"

# -- Refactoring

puts "-- Refactored"

sum = (1..integer).reduce(:+)
product = (1..integer).reduce(:*)

case operation
when 's'
  puts "The sum of integers between 1 and " +
     "#{integer} is #{sum}"
when 'p'
  puts "The product of integers between 1 and " +
     "#{integer} is #{product}"
end
