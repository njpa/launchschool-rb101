# Write a method that returns the next to last word in the String passed to
# it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Examples:

# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# ANSWER
# ======
# string -> string
# - return string contains penultimate word in argument
# - words are divided by space characters
# - assume input string always contains at least 2 words
# question: same string?  We'll assume not
# data structures: temporary array to store words
# algo:
# - given `string`
# - instantiate `words`
# - split `string` into words and store in `words`
# - set `size` to the number of elements in `words`
# - set `word` to the element in `words` at index `size - 2`
# - return `word`

def penultimate(string)
  words = string.split
  size = words.size
  word = words[size - 2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# REFACTOR

def penultimate_re(string)
  string.split[-2]
end

p penultimate_re('last word') == 'last'
p penultimate_re('Launch School is great!') == 'is'

# FURTHER EXPLORATION
# Suppose we need a method that retrieves the middle word of a
# phrase/sentence. What edge cases need to be considered? How would you
# handle those edge cases without ignoring them? Write a method that returns
# the middle word of a phrase or sentence. It should handle all of the edge
# cases you thought of.

# ANSWER
# I can think of the following edge cases:
# - string with no words
# - strings with one word
#   (for these two cases we'll assume that the method will return `nil`
#   and output a message
# - strings with even number of words
#    (for this case we'll assume the left-most word of the two middle words
#     will be returned
# I can think of some questions:
# - what makes a word (delimited by space)? We'll assume so.
# - would a simple number be considered a word?  Or only words consisting
#    of alphabetic characters? Non-alphabetic sets of characters will
#    also be considered words.

# Algorithm
# - given `string`
# - split into words and store in `words`
# - instantiate `middle_word` and set to `''`
# - get number of words and store in `size`
# - if `size` < 2, output message 'need more words', return `nil`
#   else
#     - store `size / 2` in `middle_index`
#     - assign `middle_word` to `words[middle_index]`
# - return `middle_word`

def middle(string)
  words = string.split
  size = words.size
  if size < 2
    puts 'Sorry, you have to provide a string with at least 2 words'
    nil
  else
    size.even? ? middle = (size / 2) - 1 : middle = (size / 2)
    words[middle]
  end
end

puts '-- Further exploration'
p middle("This is the middle.") == "is"
p middle("This is centered.") == "is"
p middle("This is a margin of 99px.") == "a"
p middle("These are 3 centered texts") == "3"
p middle("Hello") == nil
p middle("") == nil
