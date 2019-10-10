=begin

PROBLEM
=======

Reverse It (Part 2)
Write a method that takes one argument, a string containing one or more words,
and returns the given string with all five or more letter words reversed.
Each string will consist of only letters and spaces. Spaces should be included
only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

ANSWER
======

string -> same string
- words with 5+ letters are reversed
- question: words only separated by ' ', assume so
ds: maybe arrays?
mental model:
1) get a list of every index in the string where a ' ' character exists
2) starting from 0, take the characters from 0 to the first space index, remove
  that word and then interpolate a reversed version of that word
it in the sentence (use `#slice`). Continue doing this until reaching the end
of the string
algorithm:
- given sentence
- set spaces = []
- set spaces_in_string = true
- set counter  = 0
- while spaces_in_string
  - set index = next occurance of ' ' in sentence[counter, onwards]
  - if index is null
    set spaces_in_string = false
  - else
    - update spaces by pushing index + counter
    - update counter = index
- set start = 0
- for each number in spaces
  - set substring = spaces[start..number]
  - if substring > 5 letters
    - update sentence by removing sentence[start..number]
    - update sentence by interpolating reversed version of substring at start
  - update start = number
- return sentence
=end

require 'pry'

def reverse_words(sentence)
  space_indexes = space_indexes(sentence)

  count = 0
  start = 0

  loop do
    sub = sentence.slice!(start, space_indexes[count] - start)
    sub.reverse! if sub.size >= 5
    sentence.insert(start, sub)
    start = space_indexes[count] + 1

    count += 1

    break if count == space_indexes.size
  end

  sentence
end

def space_indexes(sentence)
  space_indexes = []

  current = 0

  loop do
    break unless sentence[current..sentence.size] &&
                 sentence[current..sentence.size].index(' ')

    next_space = (sentence[current..sentence.size].index ' ') + current
    space_indexes << next_space
    current = next_space + 1
  end

  space_indexes << sentence.size
end

sentence = 'Professional wrestling federation of usa'
p reverse_words(sentence) == "lanoisseforP gniltserw noitaredef of usa"
p sentence.object_id == reverse_words(sentence).object_id
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"
