=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an
odd integer that is supplied as an argument to the method. The smallest such
star you need to handle is a 7x7 grid.

start: 16:42
       17:07 got start to output
       17:15 finished refactoring

rules:
  - `n` number of lines
  - middle line has `n` stars
  - middle line is line `(n / 2) + 1`
  - all lines except middle have
    `space_around` number of spaces before star1
    `space_between` number of spaces after star1
    `space_between` number of spaces beflore star2
    `space_around` number of spaces after star2
  - `space_around` starts at `0`
  - `space_around` is `(n - 3) - (2 * space_between)`
  - `space_between` starts at `n -

Examples:
  star(7)

  *  *  *
   * * *
    ***
  *******
    ***
   * * *
  *  *  *

  star(9)
  *   *   *
   *  *  *
    * * *
     ***
  *********
     ***
    * * *
   *  *  *
  *   *   *
=end

def line(spaces_around, spaces_between)
  (" " * spaces_around) + "*" +
    (" " * spaces_between) + "*" +
    (" " * spaces_between) + "*" +
    (" " * spaces_around)
end

def middle_line(n)
  "*" * n
end

def star(n)
  middle = n / 2
  spaces_around = 0
  spaces_between = middle - 1

  1.upto(middle) do
    puts line(spaces_around, spaces_between)
    spaces_around += 1
    spaces_between -= 1
  end

  puts middle_line(n)

  middle.downto(1) do
    spaces_around -= 1
    spaces_between += 1
    puts line(spaces_around, spaces_between)
  end
end

star(9)

