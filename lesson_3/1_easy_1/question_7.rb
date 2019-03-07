# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:

# => "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's `Kernel#eval` method to have it execute
# this string as if it were a "recursive" method call

# eval(how_deep)

# what will be the result?

# Answer
# ------
# We'll start by evaluating the expression from the fifth method invocation.
# `add_eight(number)` will evaluate to `10`.
# We'll then execute the next invocation to the left and pass in `10` as the
# argument.  This will evaluate to `18`.
# Repeating this process again will evaluate to `26`.
# Again... `34`
# Again... `42`

puts eval(how_deep)
