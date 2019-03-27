# As we have seen previously we can use some built-in string methods to
# change the case of a string. A notably missing method is something provided
# in Rails, but not in Ruby itself...`titleize`. This method in Ruby on Rails
# creates a string that has each word capitalized as it would be in a title.
# For example, the string:

words = "the flintstones rock"

# would be:

words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

# ANSWER
# Algorithm
# - obtain and store array of words from string
# - capitalize every word
# - join it back together again

def titleize(str)
  words = str.split
  capitalized = words.map { |word| word.capitalize }
  capitalized.join(' ')
end

p titleize("Learning how to learn")
# => "Learning How To Learn"

# We can refactor this method,
def titleize(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

p titleize("Can we refactor?")
# => "Can We Refactor?"
