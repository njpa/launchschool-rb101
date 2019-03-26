# PROBLEM
# =======

# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.
# Examples:
# puts stringy(6) == '101010' => true
# puts stringy(9) == '101010101' => true
# puts stringy(4) == '1010' => true
# puts stringy(7) == '1010101' # => true

# ANSWER
# ======
# Problem:
#   input: 1 positive integer
#   output: string of alternating 1s and 0s
#   requirements (explicit):
#   - string always starts with `1`
#   - length of string should match given integer
# Examples:
#   puts stringy(6) == '010101' # => false
#   puts stringy(6) == '101010' # => true
#   puts stringy(4) == '1011' # => false
#   puts stringy(7) == '1010101' # => true
# Data structures: string input; string output
# Algorithm:
#   1. given a positive integer
#   2. instantiate `res` and set to reference `''`
#   3. loop from 1 to argument integer
#    - if current iterators is odd, append `'1'` to res
#    - else, append `'0'` to res
#   4. return `res`
# Code:

def stringy(num)
  res = ''
  (1..num).each { |current| current.odd? ? res << '1' : res << '0' }
  res
end

puts stringy(6) == '010101' # => false
puts stringy(6) == '101010' # => true
puts stringy(4) == '1011' # => false
puts stringy(7) == '1010101' # => true

# FURTHER EXPLORATION
# -------------------
# additional input: optional integer that defaults to `1`
# additional rule:

def stringy_deluxe(num, start_with = 1)
  res = ''
  if start_with == 1
    (1..num).each { |current| current.odd? ? res << '1' : res << '0' }
  else
    (0...num).each { |current| current.even? ? res << '0' : res << '1' }
  end
  res
end

puts '----------'
puts stringy_deluxe(5, 0) == '010101' # => false
puts stringy_deluxe(5, 0) == '01010' # => true
puts stringy_deluxe(5, 1) == '10101' # => true
puts stringy_deluxe(5) == '10101' # => true
