# PROBLEM
# =======
# What does `shift` do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# ANSWER
# ======
# Invoking `Hash#shift` on a hash will remove the first key-value pair from
# the caller and return this key-value pair as two-element Array object.


hash = { a: 'ant', b: 'bear' }
p hash.shift # => [:a => "ant"]

p hash # => {:b => "bear"}
