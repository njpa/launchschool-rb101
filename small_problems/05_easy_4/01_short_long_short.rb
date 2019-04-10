# Write a method that takes two strings as arguments, determines the longest
# of the two strings, and then returns the result of concatenating the
# shorter string, the longer string, and the shorter string once again. You
# may assume that the strings are of different lengths.

# Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# ANSWER
# ======
# input: 2 strings
# output: 1 string
# rules:
# - return result of concatening shorter string + longer string + shorter string
# - the strings are of different lengths
# - method can take empty strings
# data structures: nothing fancy
# algorithm:
# 1. obtain length of first string, `length_string1`
# 2. obtain length of first string, `length_string2`
# 3. instantiate `short_string`
# 4. if `length_string1` < `length_string2`
#      set `short_string` equal to `string1`
#      set `long_string` equal to `string2`
#    else
#      set `short_string` equal to `string2`
#      set `long_string` equal to `string1`
# 5. instantiate `result`, set to return value of concatenating
#    `short_string` + `long_string` + `short_string`
# 6. return `result`


def short_long_short(str1, str2)
  length_str1 = str1.length
  length_str2 = str2.length
  short_string = ''
  long_string = ''

  if str1.length < str2.length
    short_string = str1
    long_string = str2
  else
    short_string = str2
    long_string = str1
  end
  short_string + long_string + short_string
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# We'll refactor that to the following...
def shorter_long_short(str1, str2)
  str1.length < str2.length ? str1 + str2 + str1 : str2 + str1 + str2
end

p shorter_long_short('abc', 'defgh') == "abcdefghabc"
p shorter_long_short('abcde', 'fgh') == "fghabcdefgh"
p shorter_long_short('', 'xyz') == "xyz"
