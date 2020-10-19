# PROBLEM
# Build a program that asks a user for the length and width of a room
# in meters and then displays the area of the room in both square meters
# and square feet.
# Note: 1 square meter == 10.7639 square feet
# mental model: get two measurements from user, print out product and
# print out product * 3.2808399
# assumptions: no input validation required, meters can have centimeters
#  no need to round

# EXAMPLES


# DATA STRUCTURES
# none.... use floats

# =============================================================================
# ANSWER
# ------
# DONE: 14:06
# STARTED:  14:00
# DURATION: 6m

SQUARE_FEET_PER_SQUARE_METER = 10.7639

puts ">> Enter the length of the room in meters: "
length = gets.chomp.to_f

puts ">> Enter the width of the room in meters: "
width = gets.chomp.to_f

area = (length * width).round(3)
area_in_feet = (area * SQUARE_FEET_PER_SQUARE_METER).round(3)

puts "The area of the room is #{area} square meters" + \
     "(#{area_in_feet} square feet)."

# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:
