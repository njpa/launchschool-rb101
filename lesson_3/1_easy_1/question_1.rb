# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Answer
# ======
# Invoking `Array#uniq` on `numbers` will return an array with duplicate values
# removed. It will, however, not mutate the object referenced by `numbers`.
# Invoking `Kernel#puts` on `numbers` will therefore output the same value that
# it was assiged to in the first line.  This invocation will call `to_s` the
# argument, therefore formatting the object differently than it appears in the
# first line.
