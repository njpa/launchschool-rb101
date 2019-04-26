# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, `Kernel#format`, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

# Examples
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# ANSWER
# ======
# Problem:
#   input: integer
#   output: string
#   rules:
#     - we will assume it takes a positive integer or zero
#     - no fancy built-in methods
#     - we will assume that we cannot use the `Integers#digit` method,
#       actually, no methods except for `loop`, `pop` and `push`, `[]`
# Examples:
#   integer_to_string(4321) == '4321'
#   integer_to_string(0) == '0'
# Data structures: hash for storing relationships between integers and characters
# Algorithm:
#   - given `int`
#   - separate into digits and store in `digits` [subalgo]
#   - instantiate `result_string`, set to `''`
#   - for each `digit` in `digits`
#     - obtain the associated character, store in `char`
#     - push `char` into `result_string`
#   - return `result_string`
#   Subalgo: separate `num` into `digits`
#     - instantiate `arr`, set to `[]`
#     - instantiate `position`, set to `10`
#     - while quotient of `num` and `position` > 1
#       - obtain modulo of `num` and `position`, push to `arr
#       - increment `position` by * 10
#     - return `arr`
# Code:

def integer_to_string(int)
  result_string = ''
  digits = to_digits(int)
  digits = reverse_array(digits)

  counter = 0
  loop do
    result_string << char(digits[counter])
    counter += 1

    break if counter == digits.length
  end

  result_string
end

def reverse_array(arr)
  res = []

  loop do
    res << arr.pop
    break if arr.length == 0
  end

  res
end

def to_digits(num)
  arr = []
  position = 1

  loop do
    arr << (num / position) % 10
    position *= 10

    break if num / position == 0
  end

  arr
end

def char(num)
  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'][num]
end

p integer_to_string(54321)
p integer_to_string(123456789)
p integer_to_string(0)

# A slight refactor:
def to_string(int)
  result_string = ''
  digits = to_digits(int)

  counter = 0
  loop do
    result_string << char(digits[counter])
    counter += 1

    break if counter == digits.length
  end

  result_string
end

def to_digits(num)
  return [0] if num == 0

  arr = []

  while num > 0
    arr.unshift(num % 10)
    num = num / 10
  end

  arr
end

def char(num)
  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'][num]
end

puts '-- slight refactor'
p to_string(54321)
p to_string(123456789)
p to_string(0)


# A further refactor:
def stringify(int)
  result_string = ''
  digits = int.digits

  counter = 0

  while counter < digits.length
    result_string << char(digits[counter])
    counter += 1
  end

  result_string
end

def char(num)
  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'][num]
end

puts '-- slight refactor'
p stringify(54321)
p stringify(123456789)
p stringify(0)

# An even further refactor:
def stringification(int)
  int.digits.reverse.join
end

puts '-- an even further refactor'
p stringification(54321) == "54321"
p stringification(123456789) == "123456789"
p stringification(0) == "0"
