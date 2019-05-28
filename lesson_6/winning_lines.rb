=begin
input: integer
output: array of arrays
- integer represents number of cols and rows of a square
- array must contain the arrays of numbers representing
  - all vertical lines
  - all horizontal lines
  - all diagonal lines of length equal to input argument
data structures: new array
algo:
- given `size`
- instantiate `result` and set to `[]`
- instantiate `count` and set to `1`
- while `count` is less than `size x size`
  - create an array containing `size` number of elements from `count` to `size`
    example: if `size` is 5, then [1, 2, 3, 4, 5]
  - push the array into `result`
  - increase `count` by `size`
- instantiate `count` and set to `0`
- while `count` is less than `size x size`
  - create an array of `size` elements containing `(count * size) + 1`
    example: if `size` is 5, then [1, 6, 11, 16, 21]
  - push the array into `result`
- return `result`
- instantiate `forward_diagonal` and set to `[]`
- instantiate `count` and set to `0`
- while count is less than `size * size`
  - push `(count * size) + count` into `forward_diagonal`
- instantiate `backward_diagonal` and set to `[]`
=end

1 2 3
4 5 6
7 8 9

1  2  3  4  5
6  7  8  9  10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25

kkkkkkk

