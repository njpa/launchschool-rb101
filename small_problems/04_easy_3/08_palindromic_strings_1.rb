# Write a method that returns `true` if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# ANSWER
# ======
# input: string
# output: boolean
# rules:
# - return `true` if string passed as argument is a palindrom
# - return `false` if not
# - case, spaces and punctuation matter
# - palindromes read the same forward as backward
# - entire string must be a palindrome (if a subset of the string is a
#   palindrome, the method should still return `false`
# data structures:
# algorithm
# - obtain and store length of string in `length`
# - if length is odd, return false
# - if length is even, divide string into two substrings in half
#   and store as `half1` and `half2`
# - if `half1` is equal to the reversed version of `half2`, then return true,
# - if not, return false

def palindrome?(str)
  length = str.length
  half1 = str.slice(0, length/2)
  if length.odd?
    half2 = str.slice(length/2 + 1, length)
  else
    half2 = str.slice(length/2, length)
  end
  half1 === half2.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# SHORT AND SMART ANSWER
# ======================
# '... palindromes read the same forward as backward...'

def palindrome(str)
  str == str.reverse
end

# Further Exploration
# ===================
# Write a method that determines whether an array is palindromic; that is,
# the element values appear in the same sequence both forwards and backwards
# in the array. Now write a method that determines whether an array or a string
# is palindromic; that is, write a method that can take either an array or a
# string argument, and determines whether that argument is a palindrome. You
# may not use an `if`, `unless`, or `case` statement or modifier.

# input: array
# output: boolean
# rules:
# - cannot use `if`, `unless`, `case`
# - returns true if array is palindromic
# - returns false if array is not palindromic
# examples:
#   palindromic_array([1, 2, 3, 4]) # => false
#   palindromic_array([1, 2, 3, 4, 3, 2, 1]) # => false
#   palindromic_array(['a', 'z', 'a']) # => true

def palindromic_array?(arr)
  arr == arr.reverse
end

p '--'
p palindromic_array?([1, 2, 3, 4]) == false
p palindromic_array?([1, 2, 3, 4, 3, 2, 1]) == true
p palindromic_array?(['a', 'z', 'a']) == true

def palindromic_object?(obj)
  obj == obj.reverse
end

p '--'
p palindromic_object?([1, 2, 3, 4]) == false
p palindromic_object?('palindrome') == false
p palindromic_object?([1, 2, 3, 4, 3, 2, 1]) == true
p palindromic_object?('anabananananabana') == true

