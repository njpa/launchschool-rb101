# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, `Kernel#format`, etc. You may, however, use
# integer_to_string from the previous exercise.

# Examples

# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# ANSWER
# ======
# Algorithm [number_to_string]:
#   - given `number`
#   - instantiate `result` and set to `''`
#   - while `number` > 0
#     - store in `digit` he modulo of `number` and `10`
#     - prepend to `result` the character associated to `digit`
#     - reassign `number` to the quotient of `number` and `10`
#   - return `result`

def signed_to_string(num)
  case
  when num > 0  then "+#{to_string(num)}"
  when num < 0  then "-#{to_string(num.abs)}"
  else               "0"
  end
end

def to_string(num)
  result = ''

  while num > 0
    digit = num % 10
    result.prepend(CHAR[digit])
    num /= 10
  end

  result
end

CHAR = %w(0 1 2 3 4 5 6 7 8 9)

p signed_to_string(54321) == "+54321"
p signed_to_string(-54321) == "-54321"
p signed_to_string(-987654321) == "-987654321"
p signed_to_string(+987654321) == "+987654321"
p signed_to_string(0) == "0"
p signed_to_string(+0) == "0"

# Further exploration
# ===================
# Refactor our solution to reduce the 3 `integer_to_string` calls to just one.

def signed_to_string_refactored(num)
  case
  when num > 0 then sign = '+'
  when num < 0 then sign = '-'
  else              sign = ''
  end
  "#{sign}#{stringify(num.abs)}"
end

def stringify(num)
  result = ''

  loop do
    digit = num % 10
    result.prepend(CHAR[digit])
    num /= 10

    break if num == 0
  end

  result
end

CHAR = %w(0 1 2 3 4 5 6 7 8 9)

puts '-- further explorations'
p signed_to_string_refactored(54321) #== "+54321"
p signed_to_string_refactored(-54321) == "-54321"
p signed_to_string_refactored(-987654321) == "-987654321"
p signed_to_string_refactored(+987654321) == "+987654321"
p signed_to_string_refactored(0) == "0"
p signed_to_string_refactored(+0) == "0"
