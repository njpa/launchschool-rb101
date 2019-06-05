=begin

Rotation (Part 2)
=================
Write a method that can rotate the last `n` digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want.
(Recommended!)

You may assume that n is always a positive integer.

pedac
=====
int -> int -> int
- return int is first argument with last digits (second argument) rotated
- method
- assume `n` is always a positive int
- use `rotate_array` method
- question: what if `n` is larger than the number of digits in the first
  argument? Assume, `n` will always be smaller than number digits in argument
- can i use `#to_s`? yes
examples:
  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917

data structures: arrays for holding digits
algo:
- given `num`, `n`
- instantiate `result`, set to `[]`
- instantiate `digits`, store digits of `num`
- instantiate `size` set to size of `digits`
- instantiate `rotated`, set to `[]`
- store in `rotated` the last `n` digits of `num`
  [sub] range of indices from `-1 * num` unto `-1` inclusive
- rotate `rotated`
- keep in `digits` only elements in indices 0 to `size - num` (non-inclusive)
- concatenate `digits` and `rotated`, store in `result`

time
====
13:35 started pedac
13:45 started coding
13:52 stopped coding

=end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse
  size = digits.size
  rotated = rotate_array_alt(digits[(-1 * n)..-1])
  digits = digits[0...(size - n)]
  (digits + rotated).join.to_i
end

def rotate_array_alt(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# alternative
# We can perform assignment on the last `n` elements of the original digits

def rotate_rightmost_digits_alt(number, n)
  digits = number.digits.reverse
  digits[-n..-1] = rotate_array_alt(digits[-n..-1])
  digits.join.to_i
end

puts '-- alternative'
p rotate_rightmost_digits_alt(735291, 1) == 735291
p rotate_rightmost_digits_alt(735291, 2) == 735219
p rotate_rightmost_digits_alt(735291, 3) == 735912
p rotate_rightmost_digits_alt(735291, 4) == 732915
p rotate_rightmost_digits_alt(735291, 5) == 752913
p rotate_rightmost_digits_alt(735291, 6) == 352917
