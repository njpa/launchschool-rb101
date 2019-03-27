# PROBLEM
# =======
# How does `count` treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# ANSWER
# ======
# If the return value of the block is 'truthy', it adds `1` to the count
# of elements in the array for which the value of the block returns a `true`
# value.

res = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p res
