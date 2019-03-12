# In an earlier practice problem we saw that depending on a method to modify
# its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we
# wanted "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier to
# predict and easier for the next programmer to maintain?

# ANSWER
# We should either stick to having methods that mutate the arguments provided.
# In this case, we need to ensure that both arguments are mutated.

def slightly_tricky_method(a_string_param, an_array_param)
  a_string_param << ", rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
slightly_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# or, better yet, have methods return new values.

def pure_method(a_string_param, an_array_param)
  a_string_param += ", rutabaga"
  an_array_param += ["rutabaga"]
  [a_string_param, an_array_param]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = pure_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
