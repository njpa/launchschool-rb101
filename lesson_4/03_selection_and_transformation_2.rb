# EXERCISE
# ========
# Write a method named `double` that doubles all numbers in the argument array
# that have odd indices.  The method will return a new object and not mutate
# the argument.

# Tests
# -----
# p double([1, 2]) # => [1, 4]
# p double([]) # => []

# Rules
# -----
# - Do not use iterators
# - use only loops, counters and breaks

def double(arr)
  counter = 0
  selected_array = []

  loop do
    break if counter == arr.length

    current_number = arr[counter]
    current_number *= 2 if counter.odd?
    selected_array << current_number

    counter += 1
  end

  selected_array
end

p double([1, 2]) # => [1, 4]
p double([]) # => []
