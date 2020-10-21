=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must
be greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle
is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as
arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

start: 13:13/13:18/13:25
ALGO
- given s1, s2 and s3
- instantiate `longest_side` and set to `nil`
- instantiate `shortest_sides` and set to `[]`
- if `s1`, s2 or s3 are 0, return :invalid
- else if sum of `shortest_sides` is less than or equal to `longest_side`, return :invalid
- else if s1, s2, and s3 are all equal, return :equilateral
- else if elements in shortest_sides are the same, return :isosceles
- else return :scalene
- get two shortest amongst s1, s2, and s3, and save in shortest_sides

=end

def triangle(s1, s2, s3)
  short_sides, long_side = [s1, s2, s3].sort.take(2), [s1, s2, s3].sort.last
  case
  when [s1, s2, s3].any? { |x| x == 0 } then :invalid
  when short_sides.sum <= long_side     then :invalid
  when s1 == s2 && s2 == s3             then :equilateral
  when long_side == short_sides.max     then :isosceles
  else                                       :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(0, 0, 0) == :invalid # additional check, otherwise my case statement
                                # could have been a lot simpler
