# Write a program that solicits 6 numbers from the user, then prints a
# message that describes whether or not the 6th number appears amongst the
# first 5 numbers.

# Examples:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# ANSWER
# ======
# N.B.: We'll assume validation of input is not required
# Algorithm
# - instantiate counter and set equal to `0`
# - instantiate `numbers` and set to []
# - instantiate `last_number` and set to `nil`.
# - until counter == 6
#   - obtain number from user and push into `numbers`
#   - increment counter by `1`
# - remove last element from `numbers` and set `last_number` to reference it
# - check if `numbers` includes `last_number`
# - print out the appropriate message

def suffix(num)
  case num
  when 1  then 'st'
  when 2  then 'nd'
  when 3  then 'rd'
  else         'th'
  end
end

counter = 1
numbers = []

loop do
  break if counter > 6

  if counter == 6
    puts "Enter the last number: "
  else
    puts "Enter the #{counter}#{suffix(counter)} number: "
  end

  number = gets.chomp.to_i

  numbers << number

  counter += 1
end

last_number = numbers.pop

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
