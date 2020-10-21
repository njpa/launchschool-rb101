=begin
A triangle is classified as follows:

right: One angle of the triangle is a right angle (90 degrees)
acute: All 3 angles of the triangle are less than 90 degrees
obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
all angles must be greater than 0: if either of these conditions is not
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating
point errors. You may also assume that the arguments are specified in degrees.

start: 14:00/14:03/14:06
ALGO
- given a1, a2, a3
- if a1, a2, or a3 is 0, return :invalid
- else if sum of angles is not 180, return :invalid
- else if a1, a2, or a3 is equal to 90, return :right
- else if a1, a2, and a3 are all less than 90, return :acute
- else return :obtuse
=end

def triangle(a1, a2, a3)
  sides = [a1, a2, a3]
  case
  when sides.include?(0)         then :invalid
  when sides.reduce(:+) != 180   then :invalid
  when sides.include?(90)        then :right
  when sides.all? { |a| a < 90 } then :acute
  else                                       :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
