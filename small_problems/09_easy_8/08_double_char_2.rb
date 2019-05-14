# Write a method that takes a string, and returns a new string in which
# every consonant character is doubled. Vowels (a,e,i,o,u), digits,
# punctuation, and whitespace should not be doubled.

# Examples:

# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

# ANSWER
# ======
# Problem
#  input: string
#  output: string
#  rules:
#  - new string returned
#  - return string has every consonant character doubled
#  - all other characters remain the same
# Examples:
#   double_consonants('String') == "SSttrrinngg"
#   double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
#   double_consonants("July 4th") == "JJullyy 4tthh"
#   double_consonants('') == ""
# Data structures:
# - either a new array to build the string or simply a new string
# Algorithm
# - given `string`
# - instantiate `result` and set to `''`
# - for every `character` in `string`
#   - if it is a consonant, append it twice to `results`
#   - otherwise, append it once
# - return `result`
# Code

def double_consonants(string)
  result = ''

  string.chars.each do |char|
    if char =~ /[bcdfghjklmnpqrstvwxyz]/i
      result << char << char
    else
      result << char
    end
  end

  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# REFACTOR
# ========

def double_consonants_re(string)
  string.chars.each_with_object('') do |char, str|
    if char =~ /[bcdfghjklmnpqrstvwxyz]/i
      str << char << char
    else
      str << char
    end
  end
end

puts '-- Refactor'
p double_consonants_re('String') == "SSttrrinngg"
p double_consonants_re("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants_re("July 4th") == "JJullyy 4tthh"
p double_consonants_re('') == ""
