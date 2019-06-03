=begin

Always Return Negative
======================
Write a method that takes a number as an argument. If the argument is a
positive number, return the negative of that number. If the number is 0 or
negative, return the original number.

Examples;

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

ANSWER
======
integer -> integer
- returns negative of number if numbr is positive
- returns original if number is negative
- returns original if number is 0
- method
questions:
- should it return the original number? We'll assume not.
examples:
negative(5) == -5
negative(-3) == -3
negative(0) == 0
algorithm:
- given `num`
- if `num` > 0, return `num` * -1
- if `num` <= 0, return `num`

TIMING
======
13:08 problem analysis
13:10 code
13:13 finished

=end

def negative(num)
    if num > 0
          return num * -1
            else
                  return num
                    end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# REFACTORING
# ===========

def negative_refactored(num)
  num > 0 ? num * -1 : num
end

puts "-- Refactoring"
p negative_refactored(5) == -5
p negative_refactored(-3) == -3
p negative_refactored(0) == 0
