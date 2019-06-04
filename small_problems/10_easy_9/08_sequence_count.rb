=begin

Sequence Count
==============
Create a method that takes two integers as arguments. The first argument is a
count, and the second is the first number of a sequence that your method will
create. The method should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or
greater, while the starting number can be any integer value. If the count is 0,
an empty list should be returned.

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

Pedac
=====
int -> int -> arr
- first int is a count
- second int is the first number of a sequence
- return array contains same number of elements as the count
- values of each element will be multiples of starting number
- 0 count returns empty array
- assume count argument will always have value of 0 or greater
examples:
  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []
data structures: new array
algorithm:
- given `times` and `start`
- instantiate `arr` and set to `[]`
- instantiate `count` and set to `0`
- until `count` is equal to `times`
  - instantiate `num` and set to `count * start`
  - push `num` into `arr`
- return `arr`

Timing
======
19:41 pedac
19:46 code
19:48 done

=end

def sequence(times, start)
  arr = []
  count = 1

  loop do
    break if count > times

    arr.push(count * start)
    count += 1
  end

  arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# refactor

def sequence_re(times, start)
  (1..times).to_a.map { |count| count * start }
end

puts '-- refactor'
p sequence_re(5, 1) == [1, 2, 3, 4, 5]
p sequence_re(4, -7) == [-7, -14, -21, -28]
p sequence_re(3, 0) == [0, 0, 0]
p sequence_re(0, 1000000) == []
