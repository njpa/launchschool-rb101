=begin

Uppercase Check
---------------

Write a method that takes a string argument, and returns `true` if all of the
alphabetic characters inside the string are uppercase, `false` otherwise.
Characters that are not alphabetic should be ignored.

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

PEDAC
=====
string -> bool
rules
- return bool is `true` if all 'alphabetic' chars are uppercase, `false` otherwise
- non alphabetic characters are ignored
- empty string returns `true`
- method
examples:
  uppercase?('t') == false
  uppercase?('T') == true
  uppercase?('Four Score') == false
  uppercase?('FOUR SCORE') == true
  uppercase?('4SCORE!') == true
  uppercase?('') == true
data structures? nope
algorithm:
- given `str`
- instantiate `all_caps` and set to `true`
- for every `char` in `str`
  if `char` is lower case and alphabetic, reassign `all_caps` to `false`
- return `all_caps`

TIMING
======
13:51 pedac
13:55 code
13:59 done

=end

def uppercase?(str)
  all_caps = true

  str.chars.each do |char|
    all_caps = false if char =~ /[a-z]/
  end

  all_caps
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Refactored

def uppercase_re?(str)
  str.chars.each { |char| return false if char =~ /[a-z]/ }
  true
end

puts '-- refactored'
p uppercase_re?('t') == false
p uppercase_re?('T') == true
p uppercase_re?('Four Score') == false
p uppercase_re?('FOUR SCORE') == true
p uppercase_re?('4SCORE!') == true
p uppercase_re?('') == true

# Rerefactored

def uppercase_re_re?(str)
  !(str =~ /[a-z]/)
end

puts '-- rerefactored'
p uppercase_re_re?('t') == false
p uppercase_re_re?('T') == true
p uppercase_re_re?('Four Score') == false
p uppercase_re_re?('FOUR SCORE') == true
p uppercase_re_re?('4SCORE!') == true
p uppercase_re_re?('') == true

# Alternative
# The problem doesn't explicitly mention that we cannot use the `#upcase` method.

def uppercase_alt?(str)
  str == str.upcase
end

# Further exploration
# Having `#uppercase?` return `false` when it is provided an empty string could
# misleadingly hint that a lowercase character was actually found in the argument.
