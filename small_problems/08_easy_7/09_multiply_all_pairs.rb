# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# every pair of numbers that can be formed between the elements of the two
# Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Examples:

# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# ANSWER
# ======
# two arrays -> one array
# - return array has product of every pair of numbers that can be formed
#    between the two arrays
# - assume that neither argument is an empty array
# - result array should be sorted by increasing value
# - duplicates can stay
# data structures: new array for result
# algorithm:
# - given `arr1`, `arr2`
# - instantiate `res` and set to `[]`
# - instantiate `counter` and set to `0`
# - while `counter` < size of `arr1`
#   - instantiate `inner_counter` and set to `0`
#   - while `inner_counter` is less than size of `arr2`
#     - push into `res` the product of the element at index `counter` of
#       `arr1` and the element at index `inner_counter` of `arr2`
#     - increment `inner_counter` by `1`
#   - increment `counter` by `1`
# - sort `result` in ascending order
# - return `result`

def multiply_all_pairs(arr1, arr2)
  result = []
  counter = 0

  while counter < arr1.size
    inner_counter = 0

    while inner_counter < arr2.size
      result.push(arr1[counter] * arr2[inner_counter])
      inner_counter += 1
    end

    counter += 1
  end

  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# REFACTOR
# ========

def multiply_all_pairs_re(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.reduce(:*) }.sort
end

puts '--Refactor'
p multiply_all_pairs_re([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
