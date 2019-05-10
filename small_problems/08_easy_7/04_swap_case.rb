# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version, and
# every lowercase letter by its uppercase version. All other characters
# should be unchanged.

# You may not use `String#swapcase`; write your own version of this method.

# Example:

# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# ANSWER
# ======
# in: string
# out: string
# rules:
#  - returns new string
#  - every uppercase letter is replaced by its lowercase letter
#  - every lowercase letter is replaced by its uppercase letter
#  - all other characters should not change
#  - cannot use `#swapcase`
# question: can we use `upcase` and `downcase`? We'll assume so.
# data structures: maybe hash to store relationship between lowercase and
#  uppercase letters?
# algorithm:
#  - given `string`
#  - instantiate `result` and set to `''`
#  - instantiate `characters` and store characters from `string`
#  - for every `character` in `characters`
#    - swapcase
#  - return `result`
#  [subalgo]: swapcase
#    - given `char`
#    - if it is alphabetic and uppercase, return lowercase version
#    - if it is alphabetic and lowercase, return uppercase version
#    - if non-alphabetic, return `char`

def swapcase(string)
  string.chars.each_with_object('') do |character, string|
    swapped = character
    swapped = character.upcase if character =~ /[a-z]/
    swapped = character.downcase if character =~ /[A-Z]/
    string << swapped
  end
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# ALTERNATIVE
# Invoking `Array#map` would have been just fine since the return array
# (or string) is required to have the same number of elements as the
# argument.


def swapcase_map(string)
  res = string.chars.map do |character|
    swapped = character
    swapped = character.upcase if character =~ /[a-z]/
    swapped = character.downcase if character =~ /[A-Z]/
    swapped
  end
  res.join
end

puts '-- Alternative'
p swapcase_map('CamelCase') == 'cAMELcASE'
p swapcase_map('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
