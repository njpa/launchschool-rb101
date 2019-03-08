# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

# Answer
# ------
# We can try accessing it by element reference.  If invoking `Hash#[]` on it
# passing in `'Spot'` as argument returns `nil`.  The we know that `'Spot'`
# is not present in the `ages` hash.

p ages['Spot']

# Bonus
# =====
# What are two other hash methods that would work just as well for this solution?

# We can invoke `Hash#assoc` on `ages` passing in `'Spot'` as argument.  If the
# key is present, a two-element array is returned by the method containing the
# key and value.  If it is not present, a `nil` is returned.
#
p ages.assoc('Spot')

# Another way of going about this is to invoke the `Hash#fetch` array on `ages`
# passing in the String `'Spot'` and, additionally, a value for the method to
# return in case it does not find the provided key reference in the hash.  We
# can use `nil` for this purpose.  Invoking the method like so, will return
# `nil` if `'Spot'` is not present.

p ages.fetch('Spot', nil)

# OTHER OPTION
# ------------
# We can also use `Hash#key?`, `Hash#include?`, and `Hash#member?`.
# These methods have the added convenience of returning a boolean value.

p ages.key?('Spot')
p ages.include?('Spot')
p ages.member?('Spot')
