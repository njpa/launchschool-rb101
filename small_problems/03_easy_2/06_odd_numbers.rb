# Print all odd numbers from 1 to 99, inclusive. All numbers should be
# printed on separate lines.

# ANSWER
# ======
# input: none
# output: array
# rules: only odd numbers get printed; print on separate lines;
#      range from 1 to 99 inclusive
# data structures: range, array
# algorithm
# - instantiate `range`, set it to reference range object 1..99
# - iterate through range
#   - if current number is odd, output using `puts`

(1..99).each { |x| puts x if x.odd? }

# FURTHER EXPLORATION
# ===================
# Try alternatives using `Integer#upto`, `Array#select` and `while`,
# and `loop`

puts '--- using `Integer#upto`'
1.upto(99) { |x| puts x if x % 2 == 1 }

puts '--- using `Array#select`'
odd_numbers = (1..99).select { |x| x % 2 == 1 }
odd_numbers.each { |x| puts x }

puts '--- using `loop`'
counter = 0

loop do
  break if counter > 99
  counter += 1
  next if counter % 2 == 0
  puts counter
end
