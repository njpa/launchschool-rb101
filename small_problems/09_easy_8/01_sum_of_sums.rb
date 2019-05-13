# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array. You may assume that
# the Array always contains at least one number.

# Examples:

# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# ANSWER
# ======
# array of numbers -> integer
# - return integer is sum of each leading subsequence of the array
# - assume array always contains at least one number
# -
# data structures = not sure if needed
# algorithm
# - given `numbers`
# - instantiate `sum` and set to `0`
# - instantiate `size` and set to size of `array`
# - instantiate `counter` and set to `0`
# - while `counter` is less than `size`
#    - instantiate `sequence` and set to elements of `array` in
#      the range of `0` `counter`
#    - obtain the sum of elements in `sequence` and increment
#      `sum` by that amount
#    - increment `counter` by `1`
# - return `sum`

def sum_of_sums(numbers)
  sum = 0
  size = numbers.size
  counter = 0

  while counter < size
    inner_counter = 0
    while inner_counter <= counter
      sum += numbers[inner_counter]

      inner_counter += 1
    end

    counter += 1
  end

  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# REFACTOR
# ========

def sum_of_sums_re(nums)
  nums.map.with_index { |_, ind| nums[0..ind].reduce(:+) }.reduce(:+)
end

puts '-- Refactor'
p sum_of_sums_re([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums_re([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums_re([4]) == 4
p sum_of_sums_re([1, 2, 3, 4, 5]) == 35
