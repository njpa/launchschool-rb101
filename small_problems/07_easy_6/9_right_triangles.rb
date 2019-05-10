# Write a method that takes a positive integer, `n`, as an argument, and
# displays a right triangle whose sides each have `n` stars. The hypotenuse
# of the triangle (the diagonal side in the images below) should have one
# end at the lower-left of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)
#
#     *
#    **
#   ***
#  ****
# *****
# triangle(9)
#
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# ANSWER
# ======

# Problem
#   input: positive integer
#   output: output to screen
#   rules:
#   - argument determines number of lines to print
#   - each line is length of argument
#   - each line has `n` characters,
#     of which the nth determins the number of `'*'` characters
#   - `'*'` characters are padded left `n` characters with spaces
#   - first line is empty
# Examples:  see above
# Data structures: none
# Algorithm
#   - given `length`
#   - instantiate `count` and set to `1`
#   - while `count` is less than or equal to `length`
#     - instantiate `line` and set to `'*'` `count` times
#     - left pad `line` to `length` characters with space characters
#     - output `line`
# Code:

def triangle(length)
  count = 0

  while count <= length
    line = '*' * count
    line = line.rjust(length, ' ')
    puts line

    count += 1
  end
end

triangle(9)

# REFACTOR
# ========

def triangle_refactor(length)
  (length + 1).times { |count| puts ('*' * count).rjust(length, ' ') }
end

triangle_refactor(9)
