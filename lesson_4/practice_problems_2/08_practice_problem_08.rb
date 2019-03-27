# What happens when we modify an array while we are iterating over it? What
# would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# ANSWER
# ======
# On the first iteration, the code will output `1` and then remove the 2nd
# element in `numbers` mutating it to `[1, 3, 4]`.
# On the second iteration, the code will output `3`, and then remove the
# second element from `[1, 3, 4]`, mutating it to `[1, 4]`.
# Since the array now consists of two elements, the `#each` invocation will
# only iterate twice over the array.


# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# ANSWER
# ======
# First iteration: `1` is output, numbers becomes `[1, 2, 3]`
# First iteration: `2` is output, numbers becomes `[1, 2]`
# Since the array has been mutated into a two-element array,
# the `Array#each` invocation will iterate two times through the
# `numbers` array.
