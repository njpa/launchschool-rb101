=begin

Rotation (Part 3)
=================
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining
digits, you get 329175. Keep the first 2 digits fixed in place and rotate
again to 321759. Keep the first 3 digits fixed in place and rotate again to
get 321597. Finally, keep the first 4 digits fixed in place and rotate the
final 2 digits to get 321579. The resulting number is called the maximum
rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
`rotate_rightmost_digits` method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

pedac
=====
int -> int
- use `rotate_right_most_digits`
structs: new arrays
algo:=begin

Rotation (Part 3)
=================
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining
digits, you get 329175. Keep the first 2 digits fixed in place and rotate
again to 321759. Keep the first 3 digits fixed in place and rotate again to
get 321597. Finally, keep the first 4 digits fixed in place and rotate the
final 2 digits to get 321579. The resulting number is called the maximum
rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
`rotate_rightmost_digits` method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

pedac
=====
int -> int
- use `rotate_right_most_digits`
data structures: perhaps new arrays?
algo
- given `num`
- instantiate `digits` and store digits of `num`
- instantiate `index` and set to `size`
- while index > 0
  - rotate the last `size - index` digits of `digits`
  - increment `index` by `1`
- join `digits`, convert to `int`

time
====
22:10 started pedac
22:19 started coding
22:28 stopped coding

=end

def max_rotation(num)
  index = num.digits.size
  result = num

  loop do
    break if index == 0

    result = rotate_rightmost_digits_alt(result, index)

    index -= 1
  end

  result
end

def rotate_rightmost_digits_alt(number, n)
  digits = number.digits.reverse
  digits[-n..-1] = rotate_array_alt(digits[-n..-1])
  digits.join.to_i
end

def rotate_array_alt(arr)
  arr[1..-1] + [arr[0]]
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# alternative
# you can use the `Integer#downto` method for iterating:

def max_rotation_alt(num)
  result = num

  (num.digits.size.downto 1).each do |ind|
    result = rotate_rightmost_digits_alt(result, ind)
  end

  result
end

puts '-- alternative'
p max_rotation_alt(735291) == 321579
p max_rotation_alt(3) == 3
p max_rotation_alt(35) == 53
p max_rotation_alt(105) == 15 # the leading zero gets dropped
p max_rotation_alt(8_703_529_146) == 7_321_609_845
