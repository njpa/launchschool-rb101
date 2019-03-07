# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the
# original array between method calls)?

numbers.delete_at(1)

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)

# Answer
# ------
# The `Array#delete_at` mutates the caller object by removing the element
# positioned at the index number equivalent to the argument passed in.
# The `Array#delete` mutates the caller by removing all elements from the
# array that are equal to the argument value passed in.
# Note: both invocations return the value removed from the array.
