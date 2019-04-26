# In the previous exercise, you developed a method that converts simple
# numeric strings to Integers. In this exercise, you're going to extend that
# method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading `+` or `-` sign; if the
# first character is a `+`, your method should return a positive number; if it
# is a `-`, your method should return a negative number. If no sign is given,
# you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as `String#to_i`, `Integer()`, etc. You may, however, use the
# `string_to_integer` method from the previous lesson.

# Examples
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# ANSWER
# ======
# rules:
#   - we assume string always contains a valid number
#   - we assume string can only be preceeded by a `'+'`, `'-'`, or nothing
# Algorithm:
#   - given `str`
#   - instantiate `sign` and set to `1`
#   - if first character of string is `'-'`, set sign to `-1`
#     and remove character from `str`
#   - obtain integer from `str`
#   - return result of product of integer with sign

def string_to_signed_integer(str)
  case str[0]
  when '-' then -string_to_integer(str.slice(1, str.length))
  when '+' then string_to_integer(str.slice(1, str.length))
  else          string_to_integer(str)
  end
end

def string_to_integer(str)
  digits = str.split('').each_with_object([]) do |char, obj|
    obj << char_to_number(char)
  end

  position = 1
  digits.reverse.reduce do |sum, element|
    sum + (element * (position *= 10))
  end
end

def char_to_number(char)
  { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9 }[char]
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('570') == 570
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
p string_to_signed_integer('-100') == -100
p string_to_signed_integer('100') == 100

# Further Exploration
# ===================
# In our solution, we call string[1..-1] twice, and call string_to_integer
# three times. This is somewhat repetitive. Refactor our solution so it only
# makes these two calls once each.

def string_to_signed_integer_refactored(str)
  /[0-9]/.match(str[0]) ? num = str : num = str[1..-1]
  str[0] == '-' ? -string_to_integer(num) : string_to_integer(num)
end

puts '-- refactored'
p string_to_signed_integer_refactored('4321') == 4321
p string_to_signed_integer_refactored('570') == 570
p string_to_signed_integer_refactored('-570') == -570
p string_to_signed_integer_refactored('+100') == 100
p string_to_signed_integer_refactored('-100') == -100
p string_to_signed_integer_refactored('100') == 100
