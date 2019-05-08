# PROBLEM
# =======
# Write a method that takes an Array, and returns a new Array with the
# elements of the original list in reverse order. Do not modify the
# original list.

# You may not use `Array#reverse` or `Array#reverse!`, nor may you use the
# method you wrote in the previous exercise.

# Examples:
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

# ANSWER
# ======
# input: array
# output: array
# rules:
# - new array returned
# - elements in new array are reversed
# - cannot use `#reverse!` or `#reverse`
# - empty arrays and one-item arrays remain the same
# examples: see above
# data structures:
# - new array for the result
# algorithm
# - given `arr`
# - instantiate `res` and set to `[]`
# - for each `element` in `arr`
#   - take last element in `arr` and append to `res`
# - return `res`
# code:

def reverse(arr)
  arr.each_with_object([]) { |element, arr| arr.unshift element }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
