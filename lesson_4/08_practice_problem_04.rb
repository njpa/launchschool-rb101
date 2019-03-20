# PROBLEM
# =======
# What is the return value of `each_with_object` in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# ANSWER
# ======
# Invoking `Enumerable#each_with_object` on the array `['ant', 'bear', 'cat']`
# with an empty hash as argument `{}` will return the originally passed object
# after having iterated through every element in the caller and executing the
# given block (for which block parameters referencing the current element and
# the original object are provided).

# In this problem, the block will add key/value pairs to the original empty
# hash.  The key of each key/value pair will consist of the first letter of the
# current String element being iterated.  The value of each key/value pair
# will be assigned the current String element being iterated.

hsh = {}

res = ['ant', 'bear', 'cat'].each_with_object(hsh) do |value, hash|
  hash[value[0]] = value
end

p res # => {"a" => "ant", "b" => "bear", "c" => "cat"}
puts hsh.object_id == res.object_id # => true
