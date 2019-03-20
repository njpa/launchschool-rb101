# PROBLEM
# =======
# What is the return value of `map` in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# ANSWER
# ======
# Invoking `Hash#map` on the hash will return a new Array object
# containing the results of executing the block once for every
# key/value pair in the hash.
# In this problem, the block will have a return value of `value`
# if the length of the `value` string is greater than `3`.  Otherwise
# it returns `nil`.

res = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

p res # => [nil, "bear"]
