# Write a one-liner to count the number of lower-case 't' characters in the
# following string:

statement = "The Flintstones Rock!"

# ANSWER
# Casual pseudocode:
# - instantiate a variable to keep track of number of lower-case `'t'`
# characters
# - iterate through every character in the `'statement'` string
#   - if the character is equal to `'t'`, increment the number of instances.
# - print out number of instances

# Since the problem requirement statest he we should do it in a one-liner,
# we'll try to focus on iterator methods that have aggregation possibilities.
# Invoking the `Array#sum` method on a caller will iterate through every
# element of the caller and return the sum of the elements (if a block is
# provided, then the block is applied to each element before addition).

# We will first invoke `String#split` on `statement` passing in an empty
# String value `''` as argument so that it returns an array consisting of
# every character in the string.

statement.split('')
# => ["T", "h", "e", " ", "F", "l", "i", "n", "t", "s", "t", "o", "n", "e",
#     "s", " ", "R", "o", "c", "k", "!"]

# To that, we will chain an `Array#sum` method call passing in a block with
# a ternary operator expression evaluating to `1` if the currently referenced
# character in the iteration is equal to `'t'`, or `0` if it isn't.

count = statement.split('').sum { |char| char == 't' ? 1 : 0 }
puts count
# => 2

# ALTERNATIVE
# Or, we could simply use `String#count`:
puts statement.count('t')
