# PROBLEM
# =======
# Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min

# Find the documentation for the `#min` method and change the above code to
# print the two smallest values in the `Array`.

# N.B.
# ===
# We'll assume for this problem that we are in ruby 2.3, which doesn't have an
# `Array#min` method.

# ANSWER
# ======
# The `Enumerable#min` method can take one argument that will determine the
# number of elements to return.

a = [5, 9, 3, 11]
puts a.min(2) # => [3, 5]

# IMPORTANT
# =========
# `Enumerable` is not a parent class of `Array`, but a mix-in module.  The
# purpose of a mix-in module is to allow classes of different types to share
# behaviours without using inheritance.
