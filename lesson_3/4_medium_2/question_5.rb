# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# ANSWER
# One can infer that invoking a method called `color_valid` would have a
# return value of type Boolean.  Therefore, if we only need to check for
# one condition, and it is possible to translate such a condition into an
# expression that will evaluate to `true` or `false` according to the intended
# logic of the method, then we can simply use
# `color == 'blue' || color =='green'` as the expression.
# Since it is the last (and only) expression in the
# method to be evaluated, and since there is no explicit `return` statement,
# the result of this evaluation will be the return value of the method
# invocation.

def color_valid?(color)
	color == 'blue' || color == 'green'
end

puts color_valid('yellow')  # => false
puts color_valid?('yellow') # => false
