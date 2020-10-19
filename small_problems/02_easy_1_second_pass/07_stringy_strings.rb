# PROBLEM
# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.
# mental model: iterate a given number of times (argument) and build a string
# with alternating 1s and 0s starting with a 1
# assumptions:

# EXAMPLES
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE:    12:27
# STARTED: 12:22
# DURATION: 5 mins

def stringy(number)
  string = ""
  counter = 0
  state = 0

  loop do
    if state == 0
      string << "1"
      state = 1
    else
      string << "0"
      state = 0
    end

    counter += 1

    break if counter == number
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:     12:30
# STARTED:  12:27
# DURATION: 3 mins

def stringy(number)
  string = ""
  number.times do |n|
    n.even? ? string << "1" : string << "0"
  end
  string
end

p stringy(6) #== '101010'
p stringy(9) #== '101010101'
p stringy(4) #== '1010'
p stringy(7) #== '1010101'
