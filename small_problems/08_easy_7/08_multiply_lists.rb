# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# each pair of numbers from the arguments that have the same index. You may
# assume that the arguments contain the same number of elements.

# Examples:

# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# ANSWER
# ------
# two arrays with numbers -> new array
# - return array is a new array
# - return array contains product of each pair of numbers from the arguments
# - we assume both arguments contain same number of elements
# data structures: new array for return value
# algorithm:
# - given `numbers1` and `numbers2`
# - instantiate `result` and set to `[]`
# - instantiate `counter` and set to `0`
# - while `counter` is less than size of `numbers`
#   - push into result the product of the elements in
#     `numbers1` and `numbers2` that are at index `counter`
#   - increment `counter` by `1`
# - return `result`

def multiply_list(numbers1, numbers2)
  result = []
  counter = 0

  while counter < numbers1.size
    result.push(numbers1[counter] * numbers2[counter])
    counter += 1
  end

  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# REFACTOR
# ========

def multiply_list_map(nums1, nums2)
  nums1.map.with_index { |num, index| num * nums2[index] }
end

puts '-- Refactor'
p multiply_list_map([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list_map([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# FURTHER EXPLORATIONS
# Use `Array#zip` in the solution:

def multiply_list_zip(nums1, nums2)
  nums1.zip(nums2).map { |arr| arr.reduce(:*) }
end

puts '-- Further exploration'
p multiply_list_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
