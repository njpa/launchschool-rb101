# PROBLEM
# =======
# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.
# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# The tests above should print `true`.

# ANSWER
# ======

# Understanding the problem
# -------------------------
# input: a string
# output: a string with words in reverse order
# explicit requirements:
# - takes only one argument, always a string
# - returns a new string
# implicit requirements:
# - empty string given, empty string returned
# clarifying questions?  None
# mental model of problem: write a method that takes a string argument
# (always a string), detects words in the string, and then creates a new
# string with the same words in reverse order, and then returns it.

# Examples
# --------
# puts reverse_sentence('') == ''  # => true
# puts reverse_sentence('Hello World') == 'World Hello' # => true

# Data structures
# ---------------
# string; an array will likely be needed to keep track of the words

# Algorithm
# ---------
# 1. Given the string
# 2. Separate the string into an array of words and store in variable `words`
# 3. Instantiate variable `reversed_words` and set it to reference
#   a referenced version of `words`.
# 4. Instantiate string variable `res` and set it to reference `''`.
# 4. For every element in the `reversed_words` array
#    append the current word to `res`
# 5. return `res`

# Code with intent
# ----------------
def reverse_sentence(str)
  str.split.reverse. join(' ')
end

puts reverse_sentence('') == '' # => true
puts reverse_sentence('Hello World') == 'World Hello' # => true
