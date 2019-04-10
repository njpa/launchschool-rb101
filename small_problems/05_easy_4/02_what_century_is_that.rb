# Write a method that takes a year as input and returns the century. The
# return value should be a string that begins with the century number, and
# ends with `st`, `nd`, `rd`, or `th` as appropriate for that number.

# New centuries begin in years that end with `01`. So, the years 1901-2000
# comprise the 20th century.

# Examples:
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# ANSWER
# ======
# Problem:
# input: integer
# output: string
# rules:
# - return string should begin with century number
# - return string should end with 'st', 'nd' 'rd' or 'th' as appropriate
# - new centuries being in years that end with '01'
# - century is equal to (year / 100) if century % 100 == 0
# - century is equal to (year / 100) + 1 if century % 100 != 0
# - ordinals for numbers with units of...
#   `1` = 'st'
#   `2` = 'nd'
#   `3` = 'rd'
#   all other = 'th'
# Examples:
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'
# Data structures: hash for ordinals
# Algorithm:
# - instantiate `century` and set equal century according to rule
# - instantiate `unit` and set equal to ones of `century`
# - instantiate `ordinal` and set equal to relevant string according to `ordinals`
# - interpolate results accordingly, return string
#

def century(year)
  century = year / 100 if year % 100 == 0
  century = (year / 100) + 1 if year % 100 != 0
  "#{century}#{ordinal(century)}"
end

def ordinal(num)
  tens = num % 100
  ones = num % 10
  return 'th' if tens > 10 && tens < 14
  case ones
  when 1 then ordinal = 'st'
  when 2 then ordinal = 'nd'
  when 3 then ordinal = 'rd'
  else        ordinal = 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
