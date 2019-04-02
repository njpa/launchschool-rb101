# Build a program that asks a user for the length and width of a room in
# meters and then displays the area of the room in both square meters and
# square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# ANSWER
# ======
# We'll assume that,
# 1) the program can take floats for the length and width
# 2) the program does not have to validate the input
# 3) the program can show the area rounded to two decimal points

SQUARE_METER_IN_FEET = 10.7639

def area(width, length)
  area = width * length
  area_in_feet = (area * SQUARE_METER_IN_FEET)
  { meters: area, feet: area_in_feet }
end

puts "Please enter the width (in meters): "
width = gets.chomp.to_f

puts "Please enter the length (in meters): "
length = gets.chomp.to_f

areas = area(width, length)
puts "The room has #{areas[:meters].round(2)} square meters " \
     "and #{areas[:feet].round(2)} square feet."

# NOTES
# A good practice is to use constants for numbers whose meaning is not
# immediately obvious and whose value is not expected to change.

# Further Exploration
# -------------------
# Modify this program to ask for the input measurements in feet, and display
# the results in square feet, square inches, and square centimeters.

SQUARE_FOOT_IN_METERS = 0.0929
FOOT_IN_INCHES = 12

def area_deluxe(width, length)
  area_in_feet = width * length
  { feet: area_in_feet,
    meters: area_in_feet * SQUARE_FOOT_IN_METERS,
    inches: area_in_feet * FOOT_IN_INCHES }
end

puts "Please enter the width (in feet): "
width = gets.chomp.to_f

puts "Please enter the length (in feet): "
length = gets.chomp.to_f

area = area_deluxe(width, length)

puts "The room has an area of: " \
     "#{area[:feet].round(3)} square feet, " \
     "#{area[:inches].round(3)} square inches, and " \
     "#{area[:meters].round(3)} square meters!"
