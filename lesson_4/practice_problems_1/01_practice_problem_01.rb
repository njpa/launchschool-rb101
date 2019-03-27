# PROBLEM
# =======
# What is the return value of the `select` method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# ANSWER
# ======
# The `select` method invocation will return `[1, 2, 3]`.   `select`
# returns an array of the same length of less of the caller.  If the
# last evaluated line in the block evaluates to 'truthy', then the current
# element in the array is added to the array to be returned.  Since `'hi`',
# a String object, is 'truthy', every object in the array is selected.

arr = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p arr
