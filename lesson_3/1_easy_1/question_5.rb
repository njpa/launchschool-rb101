# Programmatically determine if 42 lies between 10 and 100.
# Hint: Use Ruby's range object in your solution.

# Answer
# ------
# We can create a range object with `10` and `100` and invoke the
# `Range#include?` method on it passing in `42` as the argument.
# The invocation will return `true` if `42` is an element of the range.

puts (10..100).include? 42

# We can also invoke the `#cover?` method on it.

puts (10..100).cover? 42
