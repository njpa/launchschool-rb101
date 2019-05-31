=begin

# 02_double_doubles.rb

problem
=======
A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits. For example, `44`,
`3333`, `103103`, `7676` are all double numbers. `444`, `334433`, and
`107` are not.

Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
Note: underscores are used for clarity above. Ruby lets you use underscores
when writing long numbers; however, it does not print the underscores when
printing long numbers. Don't be alarmed if you don't see the underscores
when running your tests.

answer
======
input: integer
output: integer
rules:
- return double the number if number provided is not a double number
- return integer as is if it is a double number
- a double number:
  - has even number of digits
  - has a left side exactly the same as its right side digits.
examples:
  twice(5) == 10
  twice(37) == 74
  twice(334433) == 668866
  twice(444) == 888
  twice(103103) == 103103
  twice(3333) == 3333
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
algorithm:
- given `number`
- [sub] if `number` is a double-number
    return `number`
  else
    return `number` * 2

- sub: if `number` is a double-number
  - instantiate `length` and set to length of `number`
  - if `length` is odd
      return `false`
    else
    - instantiate `first_half` and `second_half` and set both to `[]`
    - instantiate `digits` and store digits of `number`
    - store first half of `digits` in `first_half`
    - store second half of `digits` in `second_half`
    - join first half of `first_half` and compare to joined second_half
    - return evaluation of previous evaulation

timer
=====
started problem decomposition: 13:45
started coding: 13:55
stopped coding: 14:00

=end

def twice(num)
  double_number?(num) ? num : num * 2
end

def double_number?(num)
  digits = num.digits
  length = digits.length
  first_half = digits[0...length / 2]
  second_half = digits[length / 2..length]
  first_half.join == second_half.join
end

p twice(5) == 10
p twice(37) == 74
p twice(334433) == 668866
p twice(444) == 888
p twice(103103) == 103103
p twice(3333) == 3333
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
