# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.
# Examples

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# ANSWER
# ======

# PROBLEM
# input: string
# output hash
# rules:
# - hash contains number keys each showing the number of words of different
#   sizes
# - hash contains number keys
# - words consist of any string of characters that do not include a space
# - empty string returns empty hash
# - order of hash keys is not relevant
# EXAMPLES
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}
# DATA STRUCTURES
# - array to hold words found in string
# - hash to hold count of number of occurances of words with different
#   characters
# ALGORITHM
# - given `string`
# - instantiate `sizes` and set to `{}`
# - split on `' '` and store words in `words`
# - for each `word` in `words`
#   - instantiate `size` and set to size of `word`
#   - if `sizes` does not have key of `size`
#     - set `sizes[size]` equal to `1`
#     else
#     - increment `sizes[size]` by `1`
# - return `sizes`
# CODE

def word_sizes(str)
  sizes = {}
  str.split.each do |word|
    size = word.size
    if sizes.has_key?(size)
      sizes[size] += 1
    else
      sizes[size] = 1
    end
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# REFACTOR
# ========

def sizes(str)
  str.split.each_with_object({}) do |word, hsh|
    size = word.size
    hsh.has_key?(size) ? hsh[size] += 1 : hsh[size] = 1
  end
end

puts '-- Refactor'
p sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p sizes('') == {}

# INTERESTING NOTES
# =================
# When we instantiate a hash in Ruby by means of `hash = {}`, Ruby will throw
# an exception if we attempt to invoke a method on a non-existing key.  For
# example, if we do element reference on a hash `hsh[:non_existing_key]`
# referencing a key that does not yet exist, and we then invoke a method such
# as `Integer#+` on it, we will get a `NoMethodError` becuase we are attempting
# to invoke `Integer#+` on `nil`.
# If we instantiate a hash by means of `counter = Hash(0)`, where `0` is to
# be the default value of non-instantiated keys, Ruby will not throw this
# exception since `Integer#+` will be invoked on `0`.


def size_refactor(str)
  str.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.size] += 1 }
end

puts '-- Interesting notes'
p size_refactor('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p size_refactor('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p size_refactor("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p size_refactor('') == {}
