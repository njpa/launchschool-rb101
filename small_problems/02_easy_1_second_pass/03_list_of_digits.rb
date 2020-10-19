# PROBLEM
# Write a method that takes one argument, a positive integer, and returns a
# list of the digits in the number.
# assumptions: we're not checking for positive integer

# ALGORITHM
#
# instantiate an empty array `digits`
# until `number` is equal to zero
#   get the remainder of the number divided by 10
#   prepend that value to the digits array
#   reassign `number` to `number / 10`
#
# ANSWER
# ======

# using loops
def digit_list(number)
  digits = []

  loop do
    break if number == 0

    digit = number % 10
    digits.unshift(digit)

    number = number / 10
  end

  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# using loops and divmod
def digit_list(number)
  digits = []

  loop do
    number, rem = number.divmod(10)
    digits.unshift(rem)

    break if number == 0
  end

  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# using until loop
def digit_list(number)
  digits = []

  until number == 0 do
    digits.unshift(number % 10)
    number /= 10
  end

  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# using idiomatic ruby
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
