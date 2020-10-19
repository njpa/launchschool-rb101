# PROBLEM
# Create a simple tip calculator. The program should prompt for a
# bill amount and a tip rate. The program must compute the tip
# and then display both the tip and the total amount of the bill.
# mental model:
# assumptions: percentage is integer, bill is integer

# EXAMPLES
# What is the bill? 200
# What is the tip percentage? 15
# The tip is $30.0
# The total is $230.0

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE: 14:16
# STARTED:  14:10
# DURATION: 6m

puts ">> What is the bill?"
bill = gets.chomp.to_i

puts ">> What is the tip percentage?"
percentage = gets.chomp.to_i

tip = (bill.to_f * percentage)/100
total = bill + tip

puts ">> The tip is $#{tip}"
puts ">> The total is $#{total}"

puts "-----"

# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:
