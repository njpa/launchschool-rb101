# Write a method that determines and returns the ASCII string value of a
# string that is passed in as an argument. The ASCII string value is the sum
# of the ASCII values of every character in the string. (You may use
# `String#ord` to determine the ASCII value of a character.)

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# ANSWER
# ======

# PROBLEM
# input: string
# output: integer
# rules:
#   - ascii string value is sum of every ascii value of every character
#     in string
#   - empty strings accepted, return `0`
#   - can use `String#ord`
#   - space characters taken into account
# questions:
#   - take punctuation into account? We'll assume so.
# EXAMPLES
#  ascii_value('Four score') == 984
#  ascii_value('Launch School') == 1251
#  ascii_value('a') == 97
#  ascii_value('') == 0
# DATA STRUCTURES
#   - we'll store all characters of string in an `Array` object
# ALGORITHM
# - given a `string`
# - instantiate `characters` and set to `[]`
# - split `string` into array and store in `characters`
# - instantiate `sum` and set to `0`
# - for every character in `characters`
#   - increment `sum` by the ascii value of the string
# - return `sum`
# CODE

def ascii_value(string)
  sum = 0
  characters = string.chars
  characters.each { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# REFACTOR
def ascii_val(string)
  string.chars.inject(0) { |sum, char| sum + char.ord }
end

p '--'
p ascii_val('Four score') == 984
p ascii_val('Launch School') == 1251
p ascii_val('a') == 97
p ascii_val('') == 0

# FURTHER EXPLORATION
# ===================
# There is an `Integer` method such that:

# char.ord.mystery == char

# where `mystery` is our mystery method. Can you determine what method name
# should be used in place of `mystery`? What happens if you try this with a
# longer string instead of a single character?

# ANSWER
# `Integer#char` returns a string containing the character represented by the
# caller integer's value.
# If the string contains more than one character, only the first character
# is taken into consideration.
