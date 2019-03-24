# PROBLEM
# =======

# Write a method that counts the number of occurrences of each element in a
# given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: `'suv' != 'SUV'`. ` Once counted,
# print each element alongside the number of occurrences.
# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# ANSWER
# ======

# Understanding the problem
# -------------------------
# input: array with string elements
# output: string showing number of occurences of each element in the array
# explicit rules:
# - words to be counted are case-sensitive
# - every element must be counted and printed along with number of occurrences
# implicit rules
# - output must interpolate string element with number of occurences and
#   show a '=>' between the two
# mental model: write an method that takes an array of string elements and
#   returns every distinct (case-sensitive) element in the array along with
#   the number of times the elements can be found in the array.
# clarifying questions:
#   Q: can we assume that `nil` will never be a value in the array?
#   A: yes, we can assume that elements will only every be strings.

# Tests
# -----
# vehicles = [
#  'Car', 'car', 'truck', 'car', 'SUV', 'truck',
#  'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# p count_occurrences(vehicles)
# Car => 1
# car => 3
# truck => 3
# SUV => 1
# motorcycle => 2

# Data structure:
# ---------
# the distinct elements and the number of occurences for it
# can be stored in a hash.

# Algorithm
# ---------
# 1) given an array of strings
# 2) instantiate a variable `occurences` and set it to reference an empty hash
# 3) loop through every element in the array
#    if the element is not already a key in the hash
#       using reference assignment, add the key in the hash and set its value
#       to the integer value `1`
#    else
#       using reference assignment, increment the value of the key by `1`
# 4) iterate through every element in `occurrences`
#    output the key + ' => ' + value for that pair

# Code with intent
# ----------------

vehicles = [
  'Car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# the method using only loops, counters, and breaks
def count_occurrences(arr)
  occurrences = {}
  counter = 0

  loop do
    break if counter >= arr.length

    if occurrences[arr[counter]] == nil
      occurrences[arr[counter]] = 1
    else
      occurrences[arr[counter]] += 1
    end

    counter += 1
  end

  counter = 0
  keys = occurrences.keys
  loop do
    break if counter >= keys.length

    puts "#{keys[counter]} => #{occurrences[keys[counter]]}"
    counter += 1
  end
end

puts '--------'
count_occurrences(vehicles)

# A concise version using iterators and the `Array#count`
def occurrences(arr)
  occurrences = {}

  arr.each do |element|
    occurrences[element] = arr.count(element)
  end

  occurrences.each do |key, val|
    puts "#{key} => #{val}"
  end
end

puts '--------'
occurrences(vehicles)

# the one-liner
def occurring(arr)
  arr.uniq.each { |str| puts "#{str} => #{arr.count(str)}" }
end

puts '--------'
occurring(vehicles)
