# PROBLEM
# =======

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.
# Test cases:
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# SOLUTION
# ========

# Understand the problem
# ----------------------
# Expected input: a string (explicit rules)
# Expected output: an array of string elements (implicit rules)
# Explicit Rules:
#   - palindrome words are case sensitive (i.e. 'Dad' not a palindrome)
# Implicit rules:
#   - A palingdrome is a string which reads the same forwards as backwards
#   - substrings are returned in an array
#   - an empty array is returned if no palindromes are found
#   - an empty array is returned if an empty string is provided
#   - a palingdrome doesn't have to be an entire word
#       (Example:  'initialize process, Mom!' contains palingdromes
#                  'ini', 'iti', 'ss')
# Clarifying questions:
#   Q: Should the method 'only' take strings comprising one word?
#     A: We'll assume not.
#   Q: If the same palindrome is found twice, should we include it twice in
#     the results?
#     A: We'll assume so.
#   Q: Should we confine results to one-word palindromes?
#     For example, should we discard 'a nut for a jar of tuna' as a palindrome?
#     A: We'll assumed so.
#   Q: can punctuation characters be part of a palindrome?
#     For example, is 'edit_tide' valid?
#     A: We'll assume so.

# Mental Model
# ------------
# Write a method that takes a string parameter (consisting of a word or various
# words) and finds all of the palindromes in that string that are
# case-sensitive and that do not span more than one word (the can be a subtring
# of a word).  Return the palindromes in an array. If none are found, or if
# string is empty, return an empty array.

# Examples/Test Cases
# ------------------
# Provided in problem:
#   input: palindrome_substrings("supercalifragilisticexpialidocious")
#   output: ["ili"]
#   palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
#   palindrome_substrings("palindrome") == []
#   palindrome_substrings("") == []
# Additional:
#   palindrome_substrings("Londoners be saying 'init', init?") == ["ini", "ini"]
#   palindrome_substrings("def edit_tide fed ")
#                                   == ["edit_tide", "dit_tid", "it_ti", "t_t"]

# Data Structures
# ---------------
# Array (one dimensional containing string elements)

# Algorithm
# ---------
# 1) initialize empty array to store all possible substrings of string,
#    name it `substrings`.
# 2) initialize empty array to store all possible palindromes,
#    name it `palindromes`.
# 3) obtain array of all possible subtrings of the string, store in
#    `substrings` (see `all_substrings` method)
# 4) for every substring
#    - check if it is a palindrome (see `palindrome?` method)
#    - if it is a palindrome, and it does not contain ' ' characters,
#      - push the substring into the palindromes array
# 5) return the palindrome array
# *) `all_substrings` method:
#    0) takes a string as argument and returns an array
#    1) obtain length of string, store it in `string_length`.
#    2) instantiate an empty array named `substrings`.
#    3) for every `index` slot in the string:
#     - instantiate a `substring_length` variable referencing a value `2`.
#     - while current `index` + `substring_length` <= `string_length`, do
#       - obtain slice from `string` from index number `index` with a
#         length of `substring_length`, and store in local variable `sub`.
#         - push `sub` into `substrings`
#       - increment `substring_length` by `1`.
#   - return: array
# *) `palindrome?` method:
#     0) takes string as argument and returns Boolean value
#     1) Obtain and store a reversed version of the string provided.
#     2) If the provided string is equal to its reversed version,
#         and does not contain `' '` characters,
#         - return `true`
#       - else
#         - return `false`

# Code with intent
# ----------------
def all_substrings(string)
  substrings = []
  string_length = string.length
  (0...string_length).each do |index|
    substring_length = 2
    while index + substring_length <= string_length
      substrings << string.slice(index, substring_length)
      substring_length += 1
    end
  end
  substrings
end

def palindrome?(string)
  string.reverse == string && !string.include?(' ')
end

def palindrome_substrings(string)
  palindromes = []
  all_substrings = all_substrings(string)
  all_substrings.each do |substring|
    palindromes << substring if palindrome?(substring)
  end
  palindromes
end

# TESTS
# =====
p palindrome_substrings("supercalifragilisticexpialidocious")
# => ["ili"]
p palindrome_substrings("abcddcbA")
# => ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome")
# => []
p palindrome_substrings("")
# => []
p palindrome_substrings("Londoners be saying 'init', init?")
# => ["ini", "ini"]
p palindrome_substrings("def edit_tide fed ")
# => ["edit_tide"]
