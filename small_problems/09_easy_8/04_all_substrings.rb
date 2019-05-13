# Write a method that returns a list of all substrings of a string. The
# returned list should be ordered by where in the string the substring
# begins. This means that all substrings that start at position 0 should come
# first, then all substrings that start at position 1, and so on. Since
# multiple substrings will occur at each position, the substrings at a given
# position should be returned in order from shortest to longest.

# You may (and should) use the `substrings_at_start` method you wrote in the
# previous exercise:

# Examples:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# ANSWER
# ======
# string -> list of strings
# - list should be ordreed by where the substring begins in the string
# - use `substrings_at_start`
# algorithm:
# - given `string`
# - instantiate `substrings` and set to `[]`
# - instantiate `size` and set to length of string
# - instantiate `count` and set to `0`
# - while `count` < `size`
#   - instantiate strings and set to `[]`
#   - get all substrings starting at `count` [method provided]
#   - push substrings into `substrings`
#   - increments `count` by `1`
# - return `substrings`

def substrings(string)
  substrings = []
  count = 0
  size = string.size
  while count < size
    substrings_at_count = substrings_at_start(string, count)
    substrings_at_count.each { |str| substrings.push str }

    count += 1
  end
  substrings
end

def substrings_at_start(str, start)
  str.chars.each_with_object([]).with_index do |(_, obj), ind|
    substring = str[start..ind]
    obj.push(substring) unless substring.empty?
  end
end

p substrings_at_start('abc', 0) == ['a', 'ab', 'abc']
p substrings_at_start('abc', 1) == ['b', 'bc']
p substrings_at_start('abc', 2) == ['c']

p substrings('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]

# REFACTOR
# ========

def substrings_re(string)
  res = []

  0.upto(string.size) do |count|
    substrings_at_start(string, count).each { |str| res.push(str) }
  end

  res
end

puts '-- Refactor'
p substrings_re('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]

# CORRECTION # ==========
# I did not meet the problem requirements fully.  I was asked to use
# the `substring_at_start` method as was, and I modified it to take
# two arguments.

def substrings_at(str)
  str.chars.each_with_object([]).with_index do |(_, obj), ind|
    substring = str[0..ind]
    obj.push(substring) unless substring.empty?
  end
end

def substrings_corr(string)
  substrings = []
  count = 0
  size = string.size

  while count <= size
    str = string[count..size]
    strings = substrings_at(str)
    strings.each { |str| substrings.push(str) }
    count += 1
  end

  substrings
end

puts '-- Correction'
p substrings_corr('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]
