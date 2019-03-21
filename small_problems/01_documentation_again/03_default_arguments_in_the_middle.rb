# PROBLEM
# =======
# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.

# ANSWER
# ======
# In this case, the method signature for `my_method` accepts default values
# in the middle of positional arguments.
# The method has two default methods and we are providing the method 4
# arguments.  This means that only one default parameter will be referencing
# a provided argument.  Ruby fills in missing values from left to right.
#  `a` will be set to reference `4`, and `d` will be initialized to reference
# `6`.  `b` will then be initialized to reference `5` and `c` will reference
# its default value of `3`.

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

p my_method(4, 5, 6) # => [4, 5, 3, 6]
