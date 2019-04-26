# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from
# the original Array.

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# ANSWER
# ======
# Problem:
#   input: array
#   output: array
#   rules:
#     - array returns has same number of elements as argument array
#     - return array has the running total from argument array
#     - return array is empty if argument array is empty
# Examples:
#   running_total([2, 5, 13]) == [2, 7, 20]
#   running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
#   running_total([3]) == [3]
#   running_total([]) == []
# Data structures: plain arrays
# Algorithm:
#   - given `arr`
#   - instantiate `res` and set to `[]`
#   - instantiate `running_total` and set to `0`
#   - for every element in `arr`
#     - reassign `running_total` to increment by current element
#     - push `running_total` into `res`
# Code:

def running_total(arr)
  res = []
  running_total = 0

  arr.each do |element|
    running_total += element
    res << running_total
  end

  res
end

p '-- using `#each`'
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Using `#map` instead of `#each`
def running(arr)
  sum = 0
  arr.map { |x| sum += x }
end

p '-- using `#map`'
p running([2, 5, 13]) == [2, 7, 20]
p running([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running([3]) == [3]
p running([]) == []

# Further exploration
# ===================
# Try solving this problem using `Enumerable#each_with_object` or
# `Enumerable#inject` (note that `Enumerable` methods can be applied to Arrays).

def running_object(arr)
  sum = 0
  arr.each_with_object([]) do |element, obj|
    obj << sum += element
  end
end

p '-- using `#each_with_object`'
p running_object([2, 5, 13]) == [2, 7, 20]
p running_object([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_object([3]) == [3]
p running_object([]) == []

def running_inject(arr)
  res = []
  res = [arr[0]] unless arr.empty?

  arr.inject do |sum, element|
    res << sum + element
    sum + element
  end

  res
end

p '-- using `#inject`'
p running_inject([2, 5, 13]) == [2, 7, 20]
p running_inject([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_inject([3]) == [3]
p running_inject([]) == []
