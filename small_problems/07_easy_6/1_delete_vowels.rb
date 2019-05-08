# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

# Example:

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# ANSWER
# ======
# input: array of strings
# output: array of same string values
# rules:
# - return strings have vowels removed (upper case and lower case)
# - if string is composed of only vowels, empty string is the return value
# questions:
# - return same array object?  We'll assume not
# examples:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# data structures:
# - the array sent in containing strings
# - an array (or string) to hold vowels for comparison purposes
# - a new array to store modified strings
#   string values
# algorithm:
# - given `strings`
# - instantiates `result` and set to `[]`
# - instantiate `vowels` and set to `'aeiou'`
# - for each `string` in `strings`
#   - instantiate `string_modified` and set to `''`
#   - set `string_modified` equal to `string` with vowels removed
#   - push `string_modified` into `result`
# return `result`
# CODE

def remove_vowels(strings)
  strings.each_with_object([]) do |string, arr|
    arr.push(string.gsub(/[aeiou]/i, ''))
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# REFACTOR
# In this case, since we need to return an array with the same number of
# elements as the argument, we wouldn't necessarily benefit from using
# `Enumerable#each_with_object`.  We could simply use `Array#map`.

def remove_vowels_simple(strings)
  strings.map do |string|
    string.gsub(/aeiou/i, ''))
  end
end

puts '-- refactor'
p remove_vowels_simple(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels_simple(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels_simple(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
