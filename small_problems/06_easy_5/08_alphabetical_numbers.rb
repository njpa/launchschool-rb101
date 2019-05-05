# Write a method that takes an Array of Integers between 0 and 19, and
# returns an Array of those Integers sorted based on the English words for
# each number:
#
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
#
# Examples:
#
#  alphabetic_number_sort((0..19).to_a) == [
#    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#    6, 16, 10, 13, 3, 12, 2, 0
#  ]
#
# ANSWER
# ======
# PROBLEM
# input: array of integers
# output: array of same integers
# rules:
# - integers sorted based on English words for each number
# questions:
# - same array returned? We'll assume not.
# EXAMPLES
#  alphabetic_number_sort((0..19).to_a) == [
#    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#    6, 16, 10, 13, 3, 12, 2, 0
#  ]
# DATA STRUCTURES
# - hash to hold number-English dictionary
# - array given, array returned
# ALGORITHM
# - given `arr`
# - instantiate `dict` and set to `{0: 'zero', 1: 'one', ...` and so forth
#   until `19`
# - sort `arr` in ascending order based on dictionary translation, and
#   store new array in `res`
# - return `res`
# CODE

DICT = %w(zero one two three four five six seven eight nine ten eleven twelve
          thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  res = arr.sort { |a, b| DICT[a] <=> DICT[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]

# INTERESTING_NOTE
# ================
# The `sort_by` method can also be used.

def alphabetic_sort(arr)
  res = arr.sort_by { |num| DICT[num] }
end

p alphabetic_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]
