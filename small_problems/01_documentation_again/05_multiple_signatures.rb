# PROBLEM
# =======
# What do each of these `puts` statements output?

a = %w(a b c d e)
puts a.fetch(7)  rescue puts 'we rescue only to continue execution'
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# ANSWER
# ======
# The percent string `%w` will create an array of strings
# `['a', 'b', 'c', 'd', 'e']`.  This will be reference by the variable `a`.
# Invoking `Array#fetch` on this array will attempt to return the element at
# the index position of the number argument provided.  Unlike element
# reference, which will return a `nil` value if we attempt to reference an
# element in an array which is out of bounds, the `#fetch` method will raise
# an `IndexError` exception.

a = %w(a b c d e)
puts a.fetch(7)  rescue puts 'we rescue only to continue execution'
  # => index 7 outside of array bounds (IndexError)

# The method can take an optional default which will prevent the error and
# returning the default value instead.

puts a.fetch(7, 'beats me') # => "beats me"

# If a block is given it will only be executed when an invaled 'index' is
# referenced.

puts a.fetch(7) { |index| index**2 }  # => 49
