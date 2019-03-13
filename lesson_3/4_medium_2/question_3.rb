# Let's call a method, and pass both a string and an array as parameters and
# see how even though they are treated in the same way by Ruby, the results
# can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER
# Invoking `tricky_method` will mutate on of the two arguments that it accepts.
# The array parameter is mutated as the method appends a string value to it as
# a new element.  The string parameter, on the other hand, is reassigned via the
# `+=` shorthand, thereby not resulting in any mutation of the original
# referenced object.
# The `my_string` variable instantiated in the outer-scope is therefore
# unchanged and continues to reference a value of `'pumpkins'`.  The `my_array`
# variable will continue pointing at the same array object, which will contain
# a new element after the method invocation.  Its value will be
# `["pumpkins", "rutabaga"]`.
