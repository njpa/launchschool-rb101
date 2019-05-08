# PROBLEM
# =======
# Write a method that takes two Arrays as arguments, and returns an Array
# that contains all of the values from the argument Arrays. There should be
# no duplication of values in the returned Array, even if there are
# duplicates in the original Arrays.

# Example

# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# ANSWER
# ======
# Problem:
#   - input: two arrays
#   - output: one array
#   rules:
#   - return array contains all values from argument arrays
#   - no duplication of values
# Examples:
#   merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# Data structures:
#   - new array to hold elements from both arrays
# Algorithm:
#   - given `arr1` and `arr2`
#   - instantiate `res` and set to `[]`
#   - put each element of `arr1` in `res`
#   - put each element of `arr2` in `res`
#   - eliminate all duplicates
# Code:

def merge(arr1, arr2)
  res = []
  arr1.each { |element| res << element }
  arr2.each { |element| res << element }
  res.uniq
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]

# ALTERNATIVE
# ===========
# We can use `Array#concat` to obtain the resulting array

def merge_concat(arr1, arr2)
  arr1.concat(arr2).uniq
end

puts '-- Alternative'
p merge_concat([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# ALTERNATIVE 2
# ===========
# We can also use `Array#|` to obtain the union of both arrays

def merge_union(arr1, arr2)
  arr1 | arr2
end

puts '-- Alternative 2'
p merge_union([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
