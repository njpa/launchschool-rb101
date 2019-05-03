# Modify the `word_sizes` method from the previous exercise to exclude
# non-letters when determining word size. For instance, the length of
# `"it's"` is 3, not 4.
#
# Examples
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}
#
# ANSWER
# ======

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hsh|
    hsh[size_alphabetic(word)] += 1
  end
end

def size_alphabetic(string)
  string.gsub(/[^a-z]/i, '').size
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
