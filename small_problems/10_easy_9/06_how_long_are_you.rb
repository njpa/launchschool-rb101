=begin

How long are you?
=================

Write a method that takes a string as an argument, and returns an Array that
contains every word from the string, to which you have appended a space and
the word length.

You may assume that words in the string are separated by exactly one space,
and that any substring of non-space characters is a word.

Examples

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
word_lengths("") == []

PEDAC
=====
string -> array
rules:
- method
- return array contains every word from string
  - with ' ' appended and word length appended to that
- assume words separated by one space
- empty string returns empty array
examples:
  word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
  word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
  word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
  word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]
  word_lengths("") == []
data structures: new array
algorithm:
- given `str`
- instantiate `results` and set to `[]`
- instantiate `words` and set to `[]`
- split `str` into words and store in `words`
- for each `word` in `words`
  - get length of word, store in `size`
  - instantiate new_word and set equal to `word`
  - append to `new_word` a ' ' and `size`
- return `arr`

TIMING
======
14:16 pedac
14:21 code
14:25 done

=end

def word_lengths(str)
  results = []

  str.split.each do |word|
    size = word.size
    results << (word << ' ' << size.to_s)
  end

  results
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []

# Refactored

def word_lengths_re(str)
  str.split.each_with_object([]) do |word, arr|
    arr << (word + ' ' + word.size.to_s)
  end
end

puts '-- Refactored'
p word_lengths_re("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths_re("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths_re("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths_re("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths_re("") == []


# Alternative
# We can use `#map` and string interpolation as well

def word_lengths_alt(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

puts '-- alternative'
p word_lengths_alt("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths_alt("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths_alt("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths_alt("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths_alt("") == []
