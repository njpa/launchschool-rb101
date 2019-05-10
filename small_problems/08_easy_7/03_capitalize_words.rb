# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character
# of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples

# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# ANSWER
# ======
# Problem:
#    input: string
#    output: string
#    rules:
#    - new string returned
#    - return value contains original value of the argument with first
#      character of every word capitalized and all other words lowercasec
#    - non-alphabetic characters are considered (uppercased as well)
# Examples: see above
# Data structures:
#    - new array to store words from argument string
# Algorithm:
#  - given `string`
#  - instantiate `result` and set to `''`
#  - instantiate `words` and set to `[]`
#  - obtain words from string and store in `words`
#  - for each `word` in `words`, lowercase it and then capitalize
#  - return `result`
# Code:

def word_cap(string)
  string.split.map { |word| word.downcase.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# REFACTOR
# ========
# We can use shorthand notation in the argument for the `Array#map`
# invocation since we are simply invoking a core method on the block
# parameter in the block passed into the `#map` invocation.
# Additionaly, the `String#capitalize` method also downcases strings
# before capitalizing them.

def word_cap_refactor(string)
  string.split.map(&:capitalize).join(' ')
end

puts '-- Refactor'
p word_cap_refactor('four score and seven') == 'Four Score And Seven'
p word_cap_refactor('the javaScript language') == 'The Javascript Language'
p word_cap_refactor('this is a "quoted" word') == 'This Is A "quoted" Word'

# FURTHER EXPLORATION
# Do not rely on `String#capitalize`

# ANSWER
# ======
# Algorithm for capitalize:
#   - given `word`
#   - assign the first element in the string to an uppercase version of itself

def word_cap_further(string)
  string.split.map { |word| capitalize_upcase(word) }.join(' ')
  #string.split.map { |word| capitalize_swapcase(word) }.join(' ')
end

def capitalize_swapcase(word)
  first, tail = word[0], word[1..word.size]
  first.downcase.swapcase.concat(tail.downcase)
end

def capitalize_upcase(word)
  word.downcase!
  word[0] = word[0].upcase
  word
end

puts '-- Further exploration'
p word_cap_further('four score and seven') == 'Four Score And Seven'
p word_cap_further('the javaScript language') == 'The Javascript Language'
p word_cap_further('this is a "quoted" word') == 'This Is A "quoted" Word'
