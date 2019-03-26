# PROBLEM
# =======

# Write a method that takes one argument, a string containing one or more
# words, and returns the given string with all five or more letter words
# reversed. Each string will consist of only letters and spaces. Spaces
# should be included only when more than one word is present.
# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# ANSWER
# ======

# Understand the problem
# ----------------------
# input: string containing one or more words
# output: string containing one or more words
# explicit requirements:
# - reverse only words with 5 or more letters
# - strings will consist of only letters and spaces
# - spaces should be included only when more than one word is present
# implicit requirements: none
# clarifying questions:
# - Q: should it return the same object?
# - A: we'll assume not.
# mental model: write a method that takes a string (which will contain one
#   or more words in it), and return a new string containing the same words
#   with only those words with 5 or more letters in it reversed.

# Examples
# --------
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb

# Data structures
# ---------------
# string as inputs; an array to hold words; string as output

# Algorithm
# ---------
# 1. given the string
# 2. separate the string into words and store in `words`
# 3. iterate through the `words` array to map into instantiated `res` array
#       reverse the string if its length is equal or greater than 5,
#       keep the string as is if length is less than 5
# 4. return a new string containing all of the `words`

# Code with intent
# ----------------
def reverse_words(str)
  words = str.split.map { |word| word.length >= 5 ? word.reverse : word }

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
