# PROBLEM
# =======
# How does `take` work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# ANSWER
# ======
# Invoking `Array#take` on the array object with an argument of `2` will
# return a new array populated with the first `2` values of the original
# array. We can read the documentation to find out, or we can output
# `arr` object after the method invocation to find out.

arr = [1, 2, 3, 4, 5]
p arr.take(2) # => [1, 2]
p arr # => [1, 2, 3, 4, 5]
