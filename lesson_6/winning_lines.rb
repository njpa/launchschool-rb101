=begin
input: integer
output: array of arrays
rules:
  1  2  3  4  5
  6  7  8  9  10
  11 12 13 14 15
  16 17 18 19 20
  21 22 23 24 25

  1 2 3
  4 5 6
  7 8 9
  - integer represents number of cols / rows of square
  - array must contain the arrays of numbers representing
    - all vertical lines
    - all horizontal lines
    - all diagonal lines of length equal to input argument
examples:
winning_lines(3) == [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
                     [1, 5, 9], [3, 5, 7]]
data structures: new array
algorithm:
  - given `board_size`
  - instantiate `winning_lines` and set to `[]`
  - [sub] add to `winning_lines` all horizontal lines
  - [sub] add to `winning_lines` all vertical lines
  - [sub] add to `winning_lines` forward diagonal line
  - [sub] add to `winning_lines` backward diagonal line
  - return `winning_lines`

  sub: add to `winning_lines` all horizontal lines
  - instantiate `line_count` and set to `1`
  - until `line_count` is greater than `board_size`
    - instantiate `line` and set to `[]`
    - set `line` to array of `size` elements where each element is an increment
      of one over the previous, with the first element starting at
      `(line_count * size) + 1`
    - append `line` into `winning_lines`
    - increase `line_count` by `1`

  sub: add to `winning_lines` all vertical lines
  - given `board_size`
  - instantiate `line_count` and set to `1`
  - until `line_count` is greater than `board_size`
    - instantiate `line` and set to `[]`
    - set `line` to array of `size` elements where each element is
      `size` greater than the previous, with the first element
      starting at  `line_count`
    - append `line` into `winning_lines`
    - increase `line_count` by `1`

  sub: add to `winning_lines` all forward diagonal lines
  - instantiate `forward_diagonal` and set to `[]`
  - instantiate `count` and set to `0`
  - while count is less than `size * size`
    - push `(count * size) + count` into `forward_diagonal`

  sub: add to `winning_lines` all backward diagonal lines
  - instantiate `forward_diagonal` and set to `[]`
  - instantiate `count` and set to `1`
  - while `count * size` is less than `size * size`
    - push `(count * size)` into `forward_diagonal`
=end

def winning_lines(board_size)
  winning_lines = []
  winning_lines += winning_horizontal_lines(board_size)
  winning_lines += winning_vertical_lines(board_size)
  winning_lines << winning_forward_diagonal(board_size)
  winning_lines << winning_backward_diagonal(board_size)
  winning_lines
end

def winning_horizontal_lines(board_size)
  winning_lines = []
  line_count = 0

  until line_count >= board_size
    line = []
    starting_element = (line_count * board_size) + 1
    board_size.times { |ind| line.push(starting_element + ind) }
    winning_lines.push(line)

    line_count += 1
  end

  winning_lines
end

def winning_vertical_lines(board_size)
  winning_lines = []
  line_count = 1

  until line_count > board_size
    line = []
    starting_element = line_count
    board_size.times { |ind| line.push(starting_element + (ind * board_size)) }
    winning_lines.push(line)

    line_count += 1
  end

  winning_lines
end

def winning_forward_diagonal(board_size)
  forward_diagonal = []
  count = 1

  while count <= (board_size * board_size)
    forward_diagonal.push(count)
    count += (board_size + 1)
  end

  forward_diagonal
end

def winning_backward_diagonal(board_size)
  backward_diagonal = []
  count = board_size

  while count < (board_size * board_size)
    backward_diagonal.push(count)
    count += (board_size - 1)
  end

  backward_diagonal
end


# board reference
# ---------------
# 1  2  3  4  5
# 6  7  8  9  10
# 11 12 13 14 15
# 16 17 18 19 20
# 21 22 23 24 25
p winning_lines(5) == [[1, 2, 3, 4, 5],
                       [6, 7, 8, 9, 10],
                       [11, 12, 13, 14, 15],
                       [16, 17, 18, 19, 20],
                       [21, 22, 23, 24, 25],
                       [1, 6, 11, 16, 21],
                       [2, 7, 12, 17, 22],
                       [3, 8, 13, 18, 23],
                       [4, 9, 14, 19, 24],
                       [5, 10, 15, 20, 25],
                       [1, 7, 13, 19, 25],
                       [5, 9, 13, 17, 21]]
# board reference
# ---------------
# 1 2 3
# 4 5 6
# 7 8 9
p winning_lines(3) == [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                       [1, 4, 7], [2, 5, 8], [3, 6, 9],
                       [1, 5, 9], [3, 5, 7]]
