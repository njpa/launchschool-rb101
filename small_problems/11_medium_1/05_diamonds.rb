=begin

Diamonds!
=========
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Examples

diamond(1)

*

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

PEDAC
=====
int -> output
- int always odd
- outputs `n` lines
- each line has `n` characters
- first line has `(n/2) - (n-1)` space characters concatenated
  with a `'*'` and followed by `(n/2) - (n-1)` space characters
- second line has `(n/2) - (n-1)` space characters concatenated
  with a `'*'` and followed by `(n/2) - (n-1)` space characters
- this continues up until line `(n/2)`, after which point the
  reverse is done
data structures: none
algo:
- from `1` to `(n/2)`
  output `(n/2) - (n-1)` space characters concatenated
  with `(n*2) -1` `'*'` chars
- from `(n/2)` to `1`
  output `(n/2) - (n-1)` space characters concatenated
  with `(n*2) -1` `'*'` chars

TIME
====
22:51 started pedac
22:58 stopped pedac, started coding
23:06 arrived at solution
23:07 finished refactoring
23:11 finished alternative version

=end

def diamond(number)
  half = number / 2
  1.upto(half) do |num|
    puts (' ' * (half - (num - 1))) +
         ('*' * ((num * 2) -1))
  end
  (half + 1).downto(1) do |num|
    puts (' ' * (half - (num - 1))) +
         ('*' * ((num * 2) -1))
  end
end

diamond(1)
diamond(3)
diamond(9)

# Alternative
# Try breaking out the row printing to a method

def diamond_alt(number)
  half = number / 2
  1.upto(half) { |num| puts row(half, num) }
  (half + 1).downto(1) { |num| puts row(half, num) }
end

def row(half, num)
  (' ' * (half - (num - 1))) + ('*' * ((num * 2) -1))
end

puts '-- alternative'
diamond_alt(1)
diamond_alt(3)
diamond_alt(9)
