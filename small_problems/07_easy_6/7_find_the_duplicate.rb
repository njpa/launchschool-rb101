# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and
# return the duplicate value that is known to be in the array.

# Examples:

# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# ANSWER
# ======
# Problem:
#   input: array of numbers
#   output: integer
#   rules:
#   - return integer is the value that is duplicated in the argument array
#   questions:
#   - well assume the array always has a duplicate
# Examples: see above
# Data structures:
#   - hash to store occurances of each integer
# Algorithm:
#   - given `numbers`
#   - instantiate `occurances` and set to `{}`
#   - for each `number` in `numbers`
#     - if `occurances` has a key of `numbers`,
#       return `number`
#       update value of `number` key in `occurances` by 1
#     - else, store `numbers` as key in `occurances` and set value equal to 1
# Code:

def find_dup(numbers)
  occurences = Hash.new(0)
  numbers.each do |number|
    return number if occurences.has_key?(number)
    occurences[number] += 1
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# ALTERNATIVE
# ===========
# We can also simply use the `Array#count` method, which takes an element as
# argument and returns the number of instances of that value in the caller.
# The `Array#find` method would then help us find the index of the first value
# in the caller for which an `Array#count` invocation with an argument of 2
# returns `true`


def find_duplicate(numbers)
  numbers.find { |number| numbers.count(number) == 2 }
end

p '-- Alternative'
p find_duplicate([1, 5, 3, 1]) == 1
p find_duplicate([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
                  38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
                  14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
                  78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
                  89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
                  41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
                  55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
                  85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
                  40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
                  7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
