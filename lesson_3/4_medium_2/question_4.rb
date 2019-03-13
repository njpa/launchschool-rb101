# To drive that last one home...let's turn the tables and have the string show
# a modified output, while the array thwarts the method's efforts to modify the
# caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER
# The `tricky_method_two` method initializes two new local variables for
# the two parameters that are sent in (`a_string_param` and `an_array_param`)
# storing the references to the passed objects (`my_string` and `my_array`).
# Inside of the method, a method invocation of `String#<<` on `a_string_param`
# mutates that object by appending some text to it.  This mutation will impact
# the same object that is referenced by `my_string`.  `an_array_param`, on the
# other hand, reassigned to reference a new array object.
# After the `tricky_method_two` invocation, `my_string` will have a value of
# `'pumpkinsrutabaga'` and `my_array` will continue to have a value of
# `['pumpkins']`.
