# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

# Examples:

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# ANSWER
# ======
# PROBLEM
# input: string
# output: string
# rules:
# - first and last letters of every word swapped
# - we assume string contains only words and spaces
# - we assume every word contains at least one letter
#   words with one letter remain the same
# EXAMPLES
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'
# DATA STRUCTURES
# - Array will store the words in the string
# ALGORITHM
# - given `string`
# - split into words and store in `words`
# - for every `word` in `words`
# -   [sub] swap first letter with last letter in `word`
# - join `words` into a string `result`
# - return `result`
# [sub] swap first letter with last letter
# - instantiate `first_letter` and set to first character of `word`
# - instantiate `last_letter` and set to last character of `word`
# - instantiate `swapped` and set equal to `word`
# - set first character in `swapped` equal to `last_character`
# - set last character in `swapped` equal to `first_character`
# CODE

def swap(string)
  swapped = string.split(' ').map do |word|
    first_character = word[0]
    last_character = word[-1]
    word[0] = last_character
    word[-1] = first_character
    word
  end
  swapped.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# REFACTOR
# ========
# The code in the block of our `map` invocation could definitely be refactored
# into a separate function.  We can also assign two variables at the same time
# in Ruby - this is called multiple assignemnt.  This would allow us to assign
# `word[0]` and `word[-1]` in one line without running into side effects.

def swap_words(string)
  swapped = string.split(' ').map { |word| swap_characters(word) }.join(' ')
end

def swap_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

puts '-- Refactor'
p swap_words('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_words('Abcde') == 'ebcdA'
p swap_words('a') == 'a'

# FURTHER EXPLORATION
# ===================
# How come our solution passes `word` into the `swap_first_last_characters`
# method invocation instead of just passing the characters that needed to
# be swapped? Suppose we had this implementation:

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# and called the method like this:

# swap_first_last_characters(word[0], word[-1])
# Would this method work? Why or why not?

# ANSWER
# ======
# The reason we pass in `word` as an argument is so that the method has all that
# it needs to return the entire word with the swapped first and last characters.
# The reason we need to have the entire word as the return value is because the
# block of the `map` invocation needs the entire word for `map` to determine the
# new modified array.
# The code above would succesfully swap the values of `a` and `b` so that we
# have an Array returned containing the two characters passed in, but in reverse
# order.  However, this Array will not suffice for our requirements.
