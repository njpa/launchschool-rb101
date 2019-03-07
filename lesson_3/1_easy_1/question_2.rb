# Describe the difference between `!` and `?` in Ruby. And explain what would
# happen in the following scenarios:

# 1. what is != and where should you use it?
# 2. put ! before something, like !user_name
# 3. put ! after something, like words.uniq!
# 4. put ? before something
# 5. put ? after something
# 6. put !! before something, like !!user_name

# ANSWER
# Whereas the `?` operator can be used in ruby only for leaving visual cues
# to other programmers (or oneself) when used appended to method names and
# as a ternary operator, the `!` operator can be used to evaluate the value
# after which it is placed to a boolean value, and also to leave a visual cue
# to other programmers that the method before which it is placed mutates the
# object that is passed into it.

# QUESTION 1
# the `!=` (not equal) operator takes two objects and evaluates to the boolean
# object `true` if they not equal.

# QUESTION 2
# Placing the `!` before a variable name evaluates to the reverse boolean
# value of the object it references.  It the variable references something
# other than a boolean, it will evaulate to `false`.

# QUESTION 3
# Putting a `!` after a variable name will raise a SyntaxError exception.
# Putting a `!` after a method name is a convention used by rubyists to
# signal to others that the method in question mutates the object passed
# in to it.

# QUESTION 4
# Putting a `?` before a value raises a SyntaxError exception.

# QUESTION 5
# Putting a `?` after a value will raise a SyntaxError exception unless the
# literal in question is a method name.  It is a convention used by rubyists
# to signal that the method in question returns a boolean value.

# QUESTION 6
# Putting the `!!` operator before a value is the equivalent of the reverse
# boolean value of putting the `!` operator before a value.
