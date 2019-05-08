# PROBLEM
# =======
# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half
# of the original Array, respectively. If the original array contains an
# odd number of elements, the middle element should be placed in the first
# half Array.

# Examples:

# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

# ANSWER
# ======
# Problem:
#   input: array
#   output: two arrays nested in one array
#   rules:
#   - sub-arrays contain first and second halves of argument array
#   - if argument array size is odd, the middle element should be placed
#     in the first sub-array
#   - empty array argument returns two empty sub-arrays
# Examples:
#   halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
#   halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
#   halvsies([5]) == [[5], []]
#   halvsies([]) == [[], []]
# Data structures: two new arrays to store each half of the argument
# Algorithm:
#   - given `arr`
#   - instantiate `half2` and set to `[]`
#   - instantiate `midpoint` and set to size of arr divided by `2`
#   - instantiate `half1` and set to range of `1` to midpoint for `arr`
#   - instantiate `half1` and set to range of (midpoint+1) to size of `arr`
#   - return `arr`
# Code:

def halvsies(arr)
  mid = (arr.size) / 2
  mid += 1 if arr.size.odd?
  [arr[0...mid], arr[mid..arr.size]]
end

p  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p  halvsies([1, 2, 3, 4, 5, 6]) == [[1, 2, 3], [4, 5, 6]]
p  halvsies([1, 2, 3, 4, 5, 6, 7]) == [[1, 2, 3, 4], [5, 6, 7]]
p  halvsies([5]) == [[5], []]
p  halvsies([]) == [[], []]

# ALTERATIVES
# ===========
# We can also perform float division and use `Float#ceil` to arrive at the
# desired midpoint.

def halvsies2(arr)
  mid = ((arr.size) / 2.0).ceil
  [arr[0...mid], arr[mid..arr.size]]
end

puts '-- Alternative'
p  halvsies2([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p  halvsies2([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p  halvsies2([1, 2, 3, 4, 5, 6]) == [[1, 2, 3], [4, 5, 6]]
p  halvsies2([1, 2, 3, 4, 5, 6, 7]) == [[1, 2, 3, 4], [5, 6, 7]]
p  halvsies2([5]) == [[5], []]
p  halvsies2([]) == [[], []]
