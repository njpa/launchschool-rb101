# PROBLEM
# =======

# Write a method that takes an Array as an argument, and reverses its
# elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# Examples

# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1]
# list == [4, 3, 2, 1]
# list.object_id == result.object_id

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"]
# list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# reverse!(list) == ["abc"]
# list == ["abc"]

# list = []
# reverse!(list) == []
# list == []

# ANSWER
# ======

# input: array
# output: same array
# rules:
# - mutate the array
# - array must have its elements reversed
# - can't use `#reverse!` or `#reverse`
# - empty arrays and one-item arrays are returned as is
# examples: see problem
# data structures:
# - array to temporarily store elements from array
# algorithm:
# - give `array`
# - instantiate `elements` and set to `[]`
# - while `array` is not empty
#   - pop `element` out of `array` and append into `elements`
# - for each element in `elements`
#   - append `element` into `elements`
# - return `array`
# code:

def reverse_array!(arr)
  elements = []

  while !arr.empty?
    elements.push(arr.pop)
  end

  elements.each { |element| arr << element }

  arr
end

list = [1,2,3,4]
result = reverse_array!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse_array!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse_array!(list) == ["abc"]
p list == ["abc"]

list = []
reverse_array!(list) == []
p list == []

# ALTERATIVES
# ===========
# We don't need a new data structure to achieve the solution since we are not
# returning a new data structure, nor are we applying any logic to a new data
# structure.  We can do the mutation directly on the array.

def reverse!(arr)
  index_left = 0
  index_right = arr.size - 1
  while index_left < (arr.size / 2)
    arr[index_left], arr[index_right] = arr[index_right], arr[index_left]
    index_left += 1
    index_right -= 1
  end
  arr
end

puts '-- ALTERNATIVE'
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

