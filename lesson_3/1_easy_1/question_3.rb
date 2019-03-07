# Replace the word "important" with "urgent" in this string:
#
advice =
  "Few things in life are as important as house training your pet dinosaur."

# Answer
# ======
# We can either,
# Invoke `String#gsub!` on `advice` passing in `important` as the 'pattern'
# argument and `urgent` as the 'replacement' variable.

advice.gsub!('important', 'urgent')
puts advice

# Use index assignment on an array consisting of all of the words in the
# sentence (obtained by invoking `String#split` on `advice`), and then
# concatenating the words in the array back into a sentence by invoking
# `Array#join` on that array.

advice =
  "Few things in life are as important as house training your pet dinosaur."
words = advice.split
index_pattern = words.find_index('important')
words[index_pattern] = 'urgent'
advice = words.join(' ')
puts advice
