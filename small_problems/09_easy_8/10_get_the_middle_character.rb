# Write a method that takes a non-empty string argument, and returns the
# middle character or characters of the argument. If the argument has an odd
# length, you should return exactly one character. If the argument has an
# even length, you should return exactly two characters.

# Examples:

# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# ANSWER
# ======
# string -> string
# - assume argument is non-empty
# - return value is the middle character or characters
# - if argument has odd length, return value has one character
# - if argument has even length, return value has two characters
# data structures: maybe not
# algorithm:
# - given `string`
# - get length of `string` and `store` in `size`
# - instantiate `middle` and set to `''`
# - if `size` is `odd`, append to `middle` the character at index
#   `size / 2`
# - if `size` is `even`, append to `middle` the range of characters at index
#   at range `(size / 2) -1` to `(size / 2)`

def center_of(string)
  size = string.size

  if size.odd?
    string[size / 2]
  else
    string[((size/2)-1)..(size/2)]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# REFACTOR
# ========
def center_of_re(string)
  size = string.size

  size.odd? ? string[size/2] : string[((size/2)-1)..(size/2)]
end

puts '-- Refactor'
p center_of_re('I love ruby') == 'e'
p center_of_re('Launch School') == ' '
p center_of_re('Launch') == 'un'
p center_of_re('Launchschool') == 'hs'
p center_of_re('x') == 'x'

# LESSON
# ======
# The `String#[]` method can take two integers as arguments.
# In this case, the method will return the substring of the caller
# starting at index number matching the first argument with a length
# of the second argument.

def center_of_lesson(string)
  size = string.size

  size.odd? ? string[size/2] : string[((size/2)-1), 2]
end

puts '-- Lesson'
p center_of_lesson('I love ruby') == 'e'
