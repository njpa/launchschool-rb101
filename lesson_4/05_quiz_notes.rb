# The following are points to work on:

# QUESTION 1
# Initializing a hash that contains duplicate keys will raise a warning
# (not an exception) and the first occurrence is overwritten by the second.

# QUESTION 2
# Remember to pay attention to conditions added to statements.  They can be
# either `if` statements or `unless` statements.  You could easily mistake
# the `unless` for an `if`.   The logic could also be entirely reversed so
# that the `if` and `unless` both evaluate to the same (look out for that).
# Example:

  break if rhythm == 'foxtrot'
  # and
  break unless rhythm != 'foxtrot'

# QUESTIONS 3,4,5 and 6
# Look out for the order in which 'counter' incrementations and logic appear.
# Spend the few seconds required to evaluate it in your mind to ensure that
# it works.

# QUESTION 7
# The following statement is not 'always' true:
#   "If you call each with a block on an array that contains seven elements,
#   the block will always execute seven times."
# This is because a `break` statement in the block can prematurely terminate
# iterations.

# QUESTION 8
# The following statement is false:
#  "If `select` was called on an array with a block that returned a truthy
#  value on each iteration, the original array would be returned."
# The `Array#select` invocation always returns a new array.

# QUESTION 9
# `Enumerable#map` and `Enumerable#collect` perform the same function.

# QUESTION 11
# When asked to identify all the code samples which are not examples of
# 'transformation'. Take into consideration that we are looking not only
# for methods, or code, that will not mutate an argument, but
# that will also not return a new version of the Array object containing
# altered or different versions of the elements.

# For example, there IS 'transformation' in the following code.  This doesn't
# mean that the `stars` argument is mutated.  There is 'transformation'
# because the string elements in the returned Array object are different to
# the string elements in the Array object that is provided as argument.
def star_method(stars)
  arr = []
  stars.each do |star|
    arr.push(star.upcase)
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# There is also 'transformation' in the following code (again, not due any
# kind of mutation to the argument, but simply because the elements are
# reassigned:
def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# This is becase, although

# On the other hand, the following code does NOT have selection nor
# transformation:

def star_method(stars)
  for star in stars
    star.downcase
  end
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# the `downcase` invocation on each element is non-destructive.  Furthermore,
# the return value of the `for`/`in` statement is the reference to the `stars`
# object.  So, although the method returns a reference to the same object that
# was passed in, there was no mutation of the argument in the method, and there
# was no reassignment or mutation of any string elements in the Array.

# QUESTION 18
# Look out for tricky arrangements of `next` statements with conditional
# statements. For example,

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

for number in numbers
  next if number.odd?
  even_numbers << number
end

for number in numbers
  next unless number.odd?
  odd_numbers << number
end

# QUESTION 19
# When asked if a certain code performs a select operation on a hash, remember
# to check the documentation for any esoteric methods.  Methods like
# `Hash#find_all` actually return an `Array` object.

# QUESTION 20
# If we are 'selecting' from a hash based on two conditionals being true,
animals = ["chicken", "snake", "dog"]

reptiles = animals.select do |animal|
  lays_eggs?(animal) && cold_blooded?(animal)
end

# and then opted for 'filtering' it based on the same conditionals being false,
# we need to pay attention to the boolean logic.

# Note that if we used the following logic here:
reptiles = animals.reject do |animal|
  !lay_eggs?(animal) && !cold_blooded?(animal)
end

# ... we would have 'chickens' in our list of `reptiles`.  We therefore need to
# filter out animals which are 'either' not cold_blooded 'or' cannot lay eggs.

reptiles = animals.reject do |animal|
  !lays_eggs?(animal) || !cold_blooded?(animal)
end
