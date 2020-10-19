# PROBLEM
# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the
# bonus should be half of the salary. If the boolean is false, the bonus
# should be 0.

# mental model: .. returns the half of the first argument if the second
# argument is true, 0 otherwise
# assumptions:

# EXAMPLES


# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE: 13:54
# STARTED: 13:51
# DURATION: 3

def calculate_bonus(sal, elegible)
  elegible ? (sal / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:
