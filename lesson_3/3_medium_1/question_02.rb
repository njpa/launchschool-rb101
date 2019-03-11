# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# ANSWER
# Ruby will invoke `String#+` to concatenate `(40 + 2)` to the first string.
# A `TypeError` exception will be raised since the method is expecting a
# String object and not an Integer object.

# We can invoke `Integer#to_s` on `(40 + 2)`.

puts "the value of 40 + 2 is " + (40 + 2).to_s

# We could also simply interpolate `(40 + 2)` into the original string:

puts "the value of 40 + 2 is #{40 + 2}."
