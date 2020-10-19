# PROBLEM
# Write a method that takes one argument, a positive integer, and returns the
# sum of its digits.
# mental model: write a method that obtains the list of digits from an integer
# and returns its sum
# assumptions:

# EXAMPLES

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE: 13:25
# STARTED:   13:19
# DURATION: 6 mins

def sum(number)
  digits = []

  loop do
    number, rem = number.divmod(10)
    digits << rem
    break if number == 0
  end

  sum = 0
  counter = 0
  loop do
    break if counter == digits.size
    sum += digits[counter]
    counter += 1
  end

  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE: 13:28
# STARTED: 13:25
# DURATION: done

def sum(number)
  sum = 0

  number.to_s.chars.each do |x|
    sum += x.to_i
  end
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
