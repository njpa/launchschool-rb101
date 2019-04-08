# Write a method that returns an Array that contains every other element of
# an `Array` that is passed in as an argument. The values in the returned
# list should be those values that are in the 1st, 3rd, 5th, and so on
# elements of the argument Array.

# Examples:
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# ANSWER
# ======
def oddities(arr)
  oddities = []
  arr.each_with_index { |item, index| oddities << item if index.even? }
  oddities
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Further explorations
# ====================
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements
# of an array. Try to solve the problem in two or more additional ways:

def evens(arr)
  evens = []
  counter = 0

  loop do
    break if counter >= arr.length

    evens << arr[counter] if counter % 2 == 1
    counter += 1

    next if counter % 2 == 0
  end

  evens
end

puts '--'
p evens([2, 3, 4, 5, 6]) == [3, 5]
p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []

def not_odds(arr)
  evens = []
  counter = 0

  while counter < arr.length
    evens << arr[counter] if counter.odd?
    counter += 1
  end
  evens
end

puts '--'
p not_odds([2, 3, 4, 5, 6]) == [3, 5]
p not_odds([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p not_odds(['abc', 'def']) == ['def']
p not_odds([123]) == []
p not_odds([]) == []

def even_items(arr)
  arr.select.with_index { |item, index| index.odd? }
end

puts '--'
p even_items([2, 3, 4, 5, 6]) == [3, 5]
p even_items([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p even_items(['abc', 'def']) == ['def']
p even_items([123]) == []
p even_items([]) == []
