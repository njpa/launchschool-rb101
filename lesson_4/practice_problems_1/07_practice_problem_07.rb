# PROBLEM
# =======
# What is the block's return value in the following code? How is it determined?
#  Also, what is the return value of `any?` in this code and what does it
# output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# ANSWER
# ======
# The return value of the block is a boolean value determined by whether the
# current block parameter `num` is an odd number.
# Invoking `Array#any?` will return a Boolean value of `true` if any of the
# objects in the array allow for the block to return a value that is `truthy`.

# This code out

res = [1, 2, 3].any? do |num|
  puts num  # => outputs the current element of the caller
  num.odd?
end

p res # => true

# Worth noting that the block executes only once and the method returns the
# boolean value after having found the first instance for which the block
# has a 'truthy' return value.
