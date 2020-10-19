# PROBLEM
# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.
# mental model: method that instantiates a new string and assigns a reversed
# version of the argument string
# assumption:

# EXAMPLES
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# DATA STRUCTURES

# ===============
# ANSWER

def reverse_sentence(sentence)
  return "" if sentence == ""

  reversed_sentence = ""
  words = sentence.split

  loop do
    break if words.empty?

    if words.size == 1
      reversed_sentence << "#{words.pop}"
    else
      reversed_sentence << "#{words.pop} "
    end
  end

  reversed_sentence.chomp
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# END:      11:26
# START:    11:12
# DURATION:  14 mins

# idiomatic ruby

def reverse_sentence(sentence)
  reversed_sentence = sentence.split.each_with_object("") do |word, rev|
    rev.prepend(word + " ")
  end
  reversed_sentence.chop
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
