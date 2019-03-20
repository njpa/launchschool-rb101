# PROBLEM
# =======
# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# ANSWER
# ======
# Invoking `Array#pop` on the array will destructively remove the first element
# of the array and return that removed element.  Chaining the `Array#size`
# method to that return value will return the number of elements in the object.

p ['ant', 'bear', 'caterpillar'].pop.size # => 11
