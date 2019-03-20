# SELECTION
# =========
# Given the following

alphabet = 'abcdefghijklmnopqrstuvwxyz'

# select all 'g' characters

counter = 0
selected = []

loop do
  selected << alphabet[counter] if alphabet[counter] == 'g'
  counter += 1
  break if counter == alphabet.length
end

p selected

# TRANSFORMATION
# ==============
# Given the following:

fruits = ['apple', 'banana', 'pear']

# appending an 's' to each string in the array.

counter = 0

loop do
  fruits[counter] = fruits[counter] + 's'
  counter += 1
  break if counter == fruits.size
end

p fruits

# EXAMPLE WITH HASHES
# ==================
# Given the following:

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# create a method `select_produce` that selects the key-value pairs where the
# value is 'Fruit'. The return value should be:

# select_fruit(produce) => {"apple"=>"Fruit", "pear"=>"Fruit"}

def select_fruit(produce)
  fruit = {}
  produce_keys = produce.keys
  counter = 0

  loop do
    break if counter == produce_keys.length

    current_key = produce_keys[counter]
    current_value = produce[current_key]

    if current_value == 'Fruit'
      fruit[current_key] = current_value
    end

    counter += 1
  end

  fruit
end

p select_fruit(produce)
p select_fruit({})

# MUTATING THE CALLER
# ===================
# Implement a method named `double` that multiplies every element of the
# caller when invoked.  Assume that it can process empty arrays.  Do not
# use any iterator methods and rely solely on loops, counters, and breaks.

# Tests
# -----
# arr = [1, 2, 3]
# double(arr)
#   p arr => [2, 4, 6]
# arr = []
# double(arr)
#   p arr => []
# arr = [0, -1]
# double(arr)
#   p arr => [0, -2]

puts '-------------'

def double!(arr)
  counter = 0

  loop do
    break if counter == arr.length

    arr[counter] *= 2

    counter += 1
  end

  arr
end


arr = [1,2,3]
double!(arr)
p arr # => [2, 4, 6]

arr = []
double!(arr)
p arr # => []

arr = [0, -1]
double!(arr)
p arr # => [0, -2]
