# Shorten this sentence:

advice =
  "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".
# Review the `String#slice!` documentation, and use that method to make the
# return value `"Few things in life are as important as "`. But leave the
# `advice` variable as "house training your pet dinosaur.".

# ANSWER
# Invoking the `String#slice!` method on `advice` will mutate the string
# according to the argument(s) provided and at the same time return the
# portion that was deleted from the caller.
# We'll first want to find out at what index in the string we wish to start
# deleting.  We can invoke `String#index` on `advice` passing in the String
# `'house'` to find out at what index number the word starts.

index = advice.index 'house'

# We'll also need to know the length of the original string:

length = advice.length

# We'll then proceed to get a new short version whilst mutating the original
# by invoking `#slice!` on `advice` passing in `index` and the length of the
# String as arguments, and then reference the return value of this invocation
# to a variable named `short_version`.
#
short_version = advice.slice!(index, length)

p short_version
p advice
