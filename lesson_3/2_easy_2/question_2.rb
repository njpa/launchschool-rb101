# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original
# `munsters_description` above):

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# Answer
# ------
# We invoke `String#upcase!` on `munsters_description` so that it mutates
# it into a string of upper case letters and then we invoke `String#gsub!`
# on that passing in `'THE'` as the 'pattern' argument and `'tHE'` as the
# 'replacement' argument.  We can chain to this a similar call passing in
# `'MUNSTERS'` and `'mUNSTERS'` as arguments.

munsters_description.upcase!.gsub!('THE', 'tHE').gsub!('MUNSTERS', 'mUNSTERS')
p munsters_description
  # => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

# Invoking `String#downcase!` on `munsters_description` will mutate it to
# all lower-case letters.  If we chain a method call to `String#capitalize!`
# we will modify the string as desired:

munsters_description.downcase!.capitalize!
p munsters_description
  # => "The munsters are creepy in a good way."

# Invoking `String#downcase!` on `munsters_description` once more will
# change the string to:

munsters_description.downcase!
p munsters_description
  # => "the munsters are creepy in a good way."

# Invoking `String#upcase!` on `munsters_description` once more will
# change the string to:

munsters_description.upcase!
p munsters_description
  # => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
