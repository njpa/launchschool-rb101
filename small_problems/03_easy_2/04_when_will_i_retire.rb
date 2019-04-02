# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# ANSWER
# Input: integer (age), integer (retirement age)
# Output: integer (year of retirement), integer (years of work)
# Requirements: pretty clear
# Clarifying questions:
# - we'll assume input does not require validation
# - we'll assume only integers are expected for age and retirement age
# Algorithm:
# 1. obtain `age`
# 2. obtain `retirement_age`
# 3. instantiate `years_left` (`retirement_age` - `age`)
# 4. instantiate `current_year` and set to reference current year
# 5. calculate `retirement_year` (`current_year` + `years_left`)

require 'date'

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

current_year = Date.today.cwyear
years_left = retirement_age - age
retirement_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"
