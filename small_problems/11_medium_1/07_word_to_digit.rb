=begin
Word to Digit
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=end

NUMBERS = %w(zero one two three four five six seven eight nine ten)

def word_to_digit(string)
  NUMBERS.each_with_index do |num, idx|
    string.gsub!(/#{num}/, idx.to_s)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
