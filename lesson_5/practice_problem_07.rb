# Given this code, what would be the final values of `a` and `b`? Try to work
# this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# ANSWER
# ======
# When Ruby executes `arr[0] += 2`, it is reassigning the first element in
# the `arr` array object.  This element, which was previously referencing
# the same object as `a`, will now reference a new object `4`.
# The value of `a` will remain 2, since the operation did not mutate the
# `a` variable (in Ruby, numbers are immutable, and increments are merely
# reassignments).
# The last line of the code performs element reference in order to access
# `arr[1]` and then uses element assignment to assign `arr[1][0]` to a new
# value, which will be equal to `3`.
# The final value of `b` will be `[3, 8]` since we are mutating `b` in the
# last line of the code.
