# Given a string that consists of some words and an assortment of
# non-alphabetic characters, write a method that returns that string with all
# of the non-alphabetic characters replaced by spaces. If one or more
# non-alphabetic characters occur in a row, you should only have one space in
# the result (the result should never have consecutive spaces).

# Examples:

# cleanup("---what's my +*& line?") == ' what s my line '

# ANSWER
# ======
# PROBLEM
# input: string
# output: string
# rules:
# - return string with non-alphabetic characters replaced by spaces
# - non-alphabetic characters occuring in a row are replaced by one space
# - result should never have consecutive spaces
# - we'll assume that the method should return a new string rather than
#   mutating the caller
# EXAMPLES
# cleanup("---what's my +*& line?") == ' what s my line '
# DATA STRUCTURES
# Array to hold alphabetic characters
# ALGORITHM
# - given 'string'
# - instantiate 'alphabetic_chars' and set to array holding alphabetic chars
# - split `string` into characters and store in `characters`
# - instantiate `previous_space` and set equal to `false`
# - iterate through `character` in `characters`
#   - if character non-alphabetic, and `previous_space` is `false`
#     - set character to `' '`
#     - set `previous_is_space` equal to `true`
#   - if character non-alphabetic, set it to `' '`
#     - set character to `''`
#     - set `previous_is_space` equal to `false`
#
# CODE

ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

def cleanup(string)
  in_a_row = false
  result = string.chars.map do |character|
    if ALPHABETIC_CHARS.include?(character)
      in_a_row = false
      character
    elsif !in_a_row
      in_a_row = true
      ' '
    elsif in_a_row
      ''
    end
  end
  result.join
end

p cleanup("---what's my +*& line?") #== ' what s my line '

# REFACTOR
# ========
# The `String#squeeze` method takes in a character as argument and returns
# a new string where runs of the same character ocurring in the caller
# are replaced by one instance of the character.

ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

def clean_squeeze(str)
  str.chars.map { |char| ALPHA.include?(char) ? char : ' ' }.join.squeeze(' ')
end

puts '-- Refactor'
p clean_squeeze("---what's my +*& line?") #== ' what s my line '

# FURTHER REFACTOR
# ================
# We can use a regular expression as the 'pattern' argument in an invocation to
# `String#gsub`.

def regular_clean(str)
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts '-- Further refactor'
p regular_clean("---what's my +*& line?") #== ' what s my line '
