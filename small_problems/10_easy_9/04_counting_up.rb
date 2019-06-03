=begin

Counting Up
===========
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is
greater than 0.

Examples:

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

ANSWER
======
integer -> array integers
rules:
- method
- returns array of all integers between 1 and the argument (inclusive)
- assume argument always valid integer greater than 0
examples:
  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]
data structures: new array
algorithm:
- given `number`
- instantiate `numbers` and set to `[]`
- instantiate `count` and set  to `1`
- until `count` is equal to `number`
  - push `count` into `numbers`
- return `numbers`

TIMING
======
13:20 problem
13:23 coding
13:34 finished

=end

def sequence(number)
  numbers = []
  count = 1

  loop do
    break if count > number

    numbers << count
    count += 1
  end

  numbers
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# REFACTORED

def sequence_refactored(number)
  (1..number).each_with_object([]) { |num, arr| arr << num }
end

puts "-- REFACTORED"
p sequence_refactored(5) == [1, 2, 3, 4, 5]
p sequence_refactored(3) == [1, 2, 3]
p sequence_refactored(1) == [1]

# ALTERNATIVE

def sequence_alt(number)
  (1..number).to_a
end

# FURTHER EXPLORATION

def sequence_further(number)
  numbers = []
  count = 1

  loop do
    numbers << count

    break if count == number

    number > 0 ? count += 1 : count -= 1
  end

  numbers
end

puts "-- Further exploration"
p sequence_further(5) == [1, 2, 3, 4, 5]
p sequence_further(-3) == [1, 0, -1, -2, -3]
p sequence_further(1) == [1]
p sequence_further(0) == [1, 0]
p sequence_further(-1) == [1, 0, -1]
