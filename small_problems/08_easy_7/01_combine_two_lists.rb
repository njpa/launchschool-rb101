# PROBLEM
# =======
# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# Example

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# ANSWER
# ======
# Problem:
#    input: two arrays
#    output: one array
#    rules:
#    - return array contains all elements from both arguments
#      with elements taken in alternation
#    - first element of return array is the first element of the
#      first argument array
#    - we assume both arguments are non-empty arrays
#    - we assume both arguments have same number of elements
#    - returns a new array, not a mutated array
# Example:
#   interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# Data structures:
#  - a new array to store elements from both arrays
# Algorithm:
#  - given `arr1` and `arr2`
#  - instantiate `combined` and set to `[]`
#  - instantiate `size`and set to size of `arr1`
#  - for `size` number of times, do the following
#    - push into `combined` the element at index `size - 1` from `arr1`
#    - push into `combined` the element at index `size - 1` from `arr2`
#  - return `combined`
# Code:

def interleave(arr1, arr2)
  combined = []

  arr1.each_with_index do |item, index|
    combined.push(arr1[index])
    combined.push(arr2[index])
  end

  combined
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
