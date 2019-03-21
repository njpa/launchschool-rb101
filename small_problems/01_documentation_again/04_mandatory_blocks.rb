# PROBLEM
# =======
# The `Array#bsearch` method is used to search ordered Arrays more quickly than
# `#find` and `#select` can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]

# How would you search this `Array` to find the first element whose value exceeds
# `8`?

# ANSWER
# ======
# According to the documentation of `Array#bsearch`, the return value of the
# block passed into the invocation should be `true` for any element
# whose index is greater than or equal to the index number of the pertinent
# element (in this case the element is `8`).

p a.bsearch { |x| x > 8 }
