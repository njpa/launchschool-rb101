# PROBLEM
# Print all odd numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.
# mental model: iterate from 1 to 99 (inclusive) outputting the current
# number only if is odd (separate lines)
# assumptions:

# EXAMPLES


# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE:
# STARTED:  14:36
# DURATION:

100.times { |current| puts current if current.odd? }

puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:

start = 1
while start <= 99
  puts start
  start += 2
end
