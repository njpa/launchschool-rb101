# In other practice problems, we have looked at how the scope of variables
# affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one
# scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# GROUP A
# =======

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER GROUP A
# ==============
# The method definition will initialize three local variables that will point
# to the passed arguments `one`, `two`, and `three`.  The method body will
# perform some reassignment to all three variables, thereby setting references
# to new objects in all three cases.  The local variables `one`, `two`, and
# `three` are therefore unchanged by the method.

# GROUP B
# =======

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER GROUP B
# ==============
# Although we are dealing with strings here instead of numbers (which are
# immutable in Ruby), the same applies to this case.  The method does not
# modify the objects reference by the `one`, `two`, and `three` variables.

# GROUP C
# =======

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER GROUP C
# ==============
# The `mess_with_vars` method definition initializes three variables local
# to that method which will reference the objects to which the `one`, `two`
# and `three` variables point to.  The method mutates all three of those
# objects by invoking `String#gsub!` on the three local variables in the
# methods.
# The value of `one` will then result in `'two'`, the value of `two` will
# results in `'three'`, and the value of `three` will result in `'one'`.
