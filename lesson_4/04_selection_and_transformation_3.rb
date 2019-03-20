# EXERCISE
# ========
# Write a method named `multiply` which takes an array and a number argument
# and returns a new array with the array elements multiplied times the
# provided argument.

# Implicit rules:
#   For purposes of iteration, use only loops, breaks, conditionals and
# counters

# Clarifying questions
# --------------------
# Q: can the multiplier value be a float?
# A: we'll assume that it will always be an integer

# Tests
# -----
# multiply([1, 4, 3, 7, 2, 6], 3) # => [3, 12, 9, 21, 6, 18]
# multiply([], 3) # => []
# multiply([1], 0) # => [0]
# multiply([1], -3) # => [-3]

def multiply(arr, multiplicand)
  result = []
  counter = 0

  loop do
    break if counter == arr.length
    result << arr[counter] * multiplicand
    counter += 1
  end

  result
end

p multiply([1, 4, 3, 7, 2, 6], 3) # => [3, 12, 9, 21, 6, 18]
p multiply([], 3) # => []
p multiply([1], 0) # => [0]
p multiply([1], -3) # => [-3]
