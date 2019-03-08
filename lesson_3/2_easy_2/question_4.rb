# See if the name "Dino" appears in the string below:

advice =
  "Few things in life are as important as house training your pet dinosaur."

# Answer
# Invoking `String#include?` passing in `'Dino'` as argument will return a
# `true` if it appears in the string, `false` if it is not.

p advice.include? 'Dino'

# Alternative
# We can also invoke `String#match?`, which converts the argument provided to a
# RegExp (if not already a RegExp) and invokes RegExp's `#match` method on the
# caller.  The method call returns a `true` or `false` reflecting whether the
# RegExp matched the caller.

p advice.match?('things')
