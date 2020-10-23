=begin
Write a method that computes the difference between the square of the sum of
the first n positive integers and the sum of the squares of the first n
positive integers.

rule:
   # given f(3):
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
algo:
- set `sum` equal sum of the first n positive integers
- set `sum_squares` to sum of the squares of the first n integers
- return square of `sum`, - `sum_squares`
=end

def sum_square_difference(n)
  sum = (1..n).sum
  sum_squares = (1..n).reduce do |acc, n|
    acc + (n * n)
  end
  (sum * sum) - sum_squares
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150


def sum_square_difference_re(n)
  ((1..n).sum ** 2) - (1..n).reduce { |acc, n| acc + n ** 2 }
end

p sum_square_difference_re(3) == 22
p sum_square_difference_re(10) == 2640
p sum_square_difference_re(1) == 0
p sum_square_difference_re(100) == 25164150
