# PROBLEM
# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed. Each string will consist of only letters and spaces. Spaces should
# be included only when more than one word is present.
# mental model: given a sentence, split it into words and iterate through the
# words and store them in a list while reversing words that are 5+ chars long
# assumptions: new string returned

# EXAMPLES
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# DATA STRUCTURES
# arrays

# =============================================================================
# ANSWER
# ------
# DONE:     12:00
# STARTED:  11:51
# DURATION: 9 mins

def reverse_words(sentence)
  words = sentence.split
  reversed_sentence = ""
  counter = 0

  loop do
    break if counter == words.size

    word = words[counter]
    word.reverse! if word.size >= 5

    if counter == 0
      reversed_sentence << word
    else
      reversed_sentence << (" " + word)
    end

    counter = counter + 1
  end

  reversed_sentence
end

p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS


# =============================================================================
# DONE:     12:03
# STARTED:  12:01
# DURATION: 2m
# idiomatic ruby solution

def reverse_words(sentence)
  sentence.split.map { |word| word.size >= 5 ? word.reverse! : word }.join(" ")
end

puts "---"
p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS
