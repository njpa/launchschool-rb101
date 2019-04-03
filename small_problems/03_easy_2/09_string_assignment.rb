# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# ANSWER
# ======
# `name` will output `'Alice'` and `save_name` will output `'Bob'`.
# Although `name` and `save_name` will be referencing the same string
# object once they are first instantiated, the reassignment of `name`
# in the third line makes it point to a new physical memory space, leaving
# the `save_name` variable referencing the original `'Bob'` string object.

# SECOND PART
# ===========
# Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

# ANSWER
# ======
# After the first two lines of code are executed, `name` and `save_name`
# are pointing to the same string object `'Bob'`.
# The third line mutates this object.  Both `name` and `save_name` will
# reference the string object `'BOB'`.
