# PROBLEM
# =======
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# ANSWER
# ======
# We invoke `Array#map` on the Array object `[1, 2, 3]` passing in a block
# which has a return value of the block parameter `num` if `num` is less than
# or equal to `1`, and `nil` otherwise.

arr = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p arr # => [1, nil, nil]
