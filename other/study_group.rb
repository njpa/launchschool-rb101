# Write a method that takes in a string of one or more words,
# and returns the same string, but with all five or more letter words
#  reversed. Strings passed in will
#   consist of only letters and spaces. Spaces will be included only
#  when more than one word is present.

# p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
# p spin_words("This is a test") == "This is a test"
# p spin_words("This is another test") == "This is rehtona test"

=begin

string -> string
- returns same string (same object)? Assume not
- argument string has one or more words
- return string has all 5 or more words reversed
- argumetn strings have only letters and spaces
structs: array to hold words
- questions: none
algo:
Given string
SET words = []
SET iterator = 1
WHILE iterator <= size of words
  IF size of word at 'iterator' position in words has length > 5
    SET reversed = current word reversed
  ELSE
    push int result
  END

TIME
===
23:26 start

=end

def spin_words(str)
  words = str.split
  result = []

  counter = 0

  loop do
    break if counter >= words.size

    word = words[counter]
    if word.size > 5
      result.push(word.reverse)
    else
      result.push(word)
    end

    counter += 1
  end

  result.join ' '
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
p spin_words("This is a test") == "This is a test"
p spin_words("This is another test") == "This is rehtona test"




