# PROBLEM
# =======
# What is the return value of `reject` in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# ANSWER
# ======
# Invoking the `Array#reject` method on `[1, 2, 3]` will return an array
# containing only those elements of the array for which the passed block
# has a return value that is not 'truthy'.

# In the passed block, the return value will always be `nil`, which ruby
# interprets as 'falsey'.  Therefore, the invocation will return an array
# containing all of the original values.

arr = [1, 2, 3].reject do |num|
  puts num
end

p arr
