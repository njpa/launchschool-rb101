require 'pry-byebug'

=begin
Neutralizer
We wrote a `neutralize` method that removes negative words from sentences.
However, it fails to remove all of them. What exactly happens?
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
    #binding.pry
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# ANSWER
# The `neutralize` method mutates the `words` object as it iterates through
# its elements.
# This is not recommended since it could cause unexpected leaps and/or
# repetitions during the iteration of the object depending on how the object
# is mutated.
# In this particular case,
# the `words` object, which consists of 11 String objects, is reduced down
# to an object of 10 objects whilst it is iterating on its second
# object.   This causes the `boring` String element to shift into the second
# index position before the iteration reaches the third element, thereby
# failing to remove it from the object.
# A way to meet the requirements of the problem is to use selection rather
# than mutation (or mutation during iteration as is unknowingly attempted in
# this example.

def neutralize_selection(sentence)
  sentence.split.reject { |word| negative?(word) }.join(' ')
end

p neutralize_selection('These dull boring cards are part of a chaotic board game.')
