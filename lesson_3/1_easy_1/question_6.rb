# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# Answer
# ------
# The following two approaches assume that we wish to mutate the original
# object rather than create a new object.

# We can invoke the `String#prepend` method to mutate the object caller by
# prepending the argument provided (which would be `'Four score and '` in
# this particular case.

famous_words = "seven years ago..."
famous_words.prepend('Four score and ')
p famous_words

# We can also invoke the `String#insert` method on `famous_words` and
# provide `0` as the first argument and `'Four score and '` as the second.
# This will insert the string value provided in the second argument at the
# index number provided in the first argument.

famous_words = "seven years ago..."
famous_words.insert(0, 'Four score and ')
p famous_words
