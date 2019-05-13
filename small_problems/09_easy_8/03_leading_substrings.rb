# Write a method that returns a list of all substrings of a string that
# start at the beginning of the original string. The return value should
# be arranged in order from shortest to longest substring.

# Examples:

# substrings_at_start('abc') == ['a', 'ab', 'abc']
# substrings_at_start('a') == ['a']
# substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# ANSWER
# ------
# string -> array
# - return array is a list of substrings of provided string
#    that start at the beginning of the original string
# - array should be sorted in order of length (ascending)
# data structures: new array to hold substrings
# algorithm:
# - given `string`
# - instantiate `substrings` and set to `[]`
# - instantiate `counter` and set to `0`
# - instantiate `characters` and set to `[]`
# - split `string` into characters and store in `characters`
# - instantiate `size` and set length of `characters`
# - while `counter` is less than `size`
#   - instantiate `substring` and set to `''`
#   - set `substring` to range from `0` to `counter` in `string`
#   - push `substring` into `substrings`
#   - increment `counter` by `1`
# - return `substrings`

def substrings_at_start(string)
  substrings = []
  characters = string.split('')
  size = characters.size
  counter = 0

  while counter < size
    substring = characters[0..counter].join
    substrings.push(substring)

    counter += 1
  end

  substrings
end


p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# REFACTOR

def substrings_at_start_re(str)
  str.chars.each_with_object([]).with_index do |(_, obj), ind|
    obj.push(str[0..ind])
  end
end

puts '-- Refactor'
p substrings_at_start_re('abc') == ['a', 'ab', 'abc']
p substrings_at_start_re('a') == ['a']
p substrings_at_start_re('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

