# The `String#to_i` method converts a string of numeric characters (including
# an optional plus or minus sign) to an `Integer`. `String#to_i` and the
# `Integer` constructor (`Integer()`) behave similarly. In this exercise,
# you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading `+` or `-` signs, nor should you worry
# about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby,
# such as `String#to_i`, `Integer()`, etc. Your method should do this the
# old-fashioned way and calculate the result by analyzing the characters in
# the string.

# Examples

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# ANSWER
# ======
# Problem:
#   input: string
#   output: integer
#   rules:
#     - no need to worry about `'+'` and `'-'` characters
#     - can assume all characters are numeric
#     - cannot rely on any Ruby conversion methods
# Examples:
#   string_to_integer('4321') == 4321
#   string_to_integer('570') == 570
# Data structures: hash to associate strings to numbers
# Algorithm:
#   - given `str`
#   - split `str` into array of digits and store in `string_digits`
#   - instantiate `digits`, set it to `[]`
#   - instantiate hash `string_number_hash`, use this to
#     associate strings to numbers, for example {'1' => 1}
#   - for each element in `string_digits`
#     - access the value from `string_number_hash` using the current
#       element as key
#     - push that value into `digits`
#   - join elements in `digits` and store in `number` [subalgorithm]
#     - instantiate `position` and set to `1`
#     - instantiate `number` and set it to `0`
#     - while `digits`.length > 0
#       - pop last element from digits and store as `last_element`
#       - increment `position` times `10`
#       - increment `number` by `position` * `last_element`
# Code:

def string_to_integer(str)
  string_digits = str.split('')
  digits = []
  string_digits.each do |char|
    digits << char_to_number(char)
  end

  arr_to_int(digits)
end

def arr_to_int(arr)
  position = 1
  result = 0
  loop do
    break if arr.empty?

    result += arr.pop * position
    position *= 10
  end

  result
end

def char_to_number(char)
  relationship = { '0' => 0,
                   '1' => 1,
                   '2' => 2,
                   '3' => 3,
                   '4' => 4,
                   '5' => 5,
                   '6' => 6,
                   '7' => 7,
                   '8' => 8,
                   '9' => 9 }
  relationship[char]
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration
# ===================
# Write a `hexadecimal_to_integer` method that converts a string representing
#  hexadecimal number to its integer value.

# Example:

# hexadecimal_to_integer('4D9f') == 19871

# ANSWER
# ======
# Problem
#   input: string
#   output: interger
#   rules:
#     - assume string represents a valid hex number
#     - assume letters in hex will always be provided in upper case
# Example
#   hexadecimal_to_integer('4D9f') == 19871
# Data structure:
#   - hash to access number associated to hex character, we'll use a constant
# Algorithm:
#   - instantiate constant mapping relationships between hexadecimal
#     characters and numbers
#   - given `str`
#   - store in `chars` the four characters of `str`
#   - instantiate `number`, set to `0`
#   - instantiate `power`, set to `0`
#   - while items in `chars` > 0
#     - pop item out of `chars`, multiply item by `16` to the power of `power`
#       and increment number by the return value of that
#     - increment power by `1`

CHAR_TO_DIGIT = { '0' => 0,
                  '1' => 1,
                  '2' => 2,
                  '3' => 3,
                  '4' => 4,
                  '5' => 5,
                  '6' => 6,
                  '7' => 7,
                  '8' => 8,
                  '9' => 9,
                  'A' => 10,
                  'B' => 11,
                  'C' => 12,
                  'D' => 13,
                  'E' => 14,
                  'F' => 15 }

def hexadecimal_to_integer(str)
  chars = str.chars
  number = 0
  power = 0

  loop do
    break if chars.empty?

    hex_value = CHAR_TO_DIGIT[chars.pop]
    number += hex_value * (16 ** power)

    power += 1
  end

  number
end

puts '-- Further expolorations'
p hexadecimal_to_integer('4D9F') == 19871

# We'll refactor that to:
def hex_to_integer(str)
  values = str.chars.map.with_index do |char, index|
    CHAR_TO_DIGIT[char] * (16 ** (index - 3).abs)
  end

  values.reduce(:+)
end

puts '-- Further expolorations (refactor)'
p hex_to_integer('4D9F') == 19871
