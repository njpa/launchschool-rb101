# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.
# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# ANSWER
# ======
# Problem:
# input: integer (bill), integer (tip %)
# output: float (tip), float (total bill)
# explicit requirements:
#  - prompt user for bill and tip %
# implicit requirements
#  - prompts take integers
#  - percentage is entered as whole number
#  - round of output to one decimal place
# clarifying questions:
#  Q: should we validate input?
#  A: We'll assume not
# Examples:
#  - bill: 200
#  - tip percentage: 15
#  - tip: 30
#  - total: 230
# Data structures: nothing fancy
# Algorithm:
#  1. obtain bill
#  2. obtain tip %
#  3. calculate tip and store in `tip`
#  4. calculate total bill (tip + bill) and store in `total`
#  5. output tip and total

# Code:

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = (gets.chomp.to_f) / 100

tip = bill * tip_percentage
total = bill + tip

puts "The tip is $#{tip.round(1)}"
puts "The total is $#{total.round(1)}"
