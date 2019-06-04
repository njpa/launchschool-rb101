=begin

Grocery List
============
Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit.

Example:

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

pedac
=====
arr -> arr
- method
- argument array contains subarrays with fruit and quantities
- return array contains fruit name according to quantity
- question: can there be 0 fruit? Yes, simply do not introduce it into the
  return array
example:
  buy_fruit([["apples", 0], ["kiwi", 1]]) == ["kiwi"]
  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
    ["apples", "apples", "apples", "orange", "bananas","bananas"]
data structures: new array
algorithm:
- given `fruit_types`
- instantiate `fruit` and set to `[]`
- for each `fruit_type` in `fruit_types`
  - push into `fruit` the element at fruit_type[0] the number of times
    in fruit_type[1]
- return `fruit`

stopwatch
=========
13:13 pedac
13:17 code
13:21 done
13:25 refactored

=end

def buy_fruit(fruit_types)
  fruit = []

  count = 0

  loop do
    break if count == fruit_types.size

    counter = 1

    loop do
      break if counter > fruit_types[count][1]

      fruit.push(fruit_types[count][0])
      counter += 1
    end

    count += 1
  end

  fruit
end

p buy_fruit([["apples", 0], ["kiwi", 1]]) == ["kiwi"]
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# refactor

def buy_fruit_re(fruit_types)
  fruit_types.each_with_object([]) do |fruit_type, arr|
    fruit_type[1].times { arr.push(fruit_type[0]) }
  end
end

puts '-- refactor'
p buy_fruit_re([["apples", 0], ["kiwi", 1]]) == ["kiwi"]
p buy_fruit_re([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# alternative
# ===========
# we can use `#map`, `#flatten`, and the ability to access both
# elements of the array with block parameters:

def buy_fruit_alt(fruit)
  fruit.map { |type, quantity| [type] * quantity }.flatten
end

puts '-- alternative'
p buy_fruit_alt([["apples", 0], ["kiwi", 1]]) == ["kiwi"]
p buy_fruit_alt([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
    ["apples", "apples", "apples", "orange", "bananas","bananas"]
