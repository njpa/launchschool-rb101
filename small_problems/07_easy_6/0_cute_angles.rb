# Write a method that takes a floating point number that represents an
# angle between 0 and 360 degrees and returns a String that represents
# that angle in degrees, minutes and seconds. You should use a degree
# symbol (`°`) to represent degrees, a single quote (`'`) to represent minutes,
# and a double quote (`"`) to represent seconds. A degree has 60 minutes,
# while a minute has 60 seconds.

# Examples:

# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Note: your results may differ slightly depending on how you round values,
# but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the
# minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol: `DEGREE = "\xC2\xB0"`

# ANSWER
# ======
# PROBLEM
# input: float
# output: string
# rules:
# - degrees = the argument truncated, example: `254.6` is 254 degrees
# - minutes = 0.6 * (remaining decimals from degrees * 100), truncated
# - seconds = 0.6 * (remaining decimals from minutes * 100)
# - use zero-padding when formatting minutes and seconds
# - use the constant `"\xC2\xB0"` for degree symbol
# - round values to the nearest second
# DATA STRUCTURES
# ??
# ALGORITHMS
# - given `angle`
# - instantiate `degrees` and set to quotient of integer division by 1
# - instantiate `remainder` and set to remainder of division
# - instantiate `minutes` and set to (`remainder` * 100) * 0.6
# - reassign `remainder` to remainder of division
# - instantiate `seconds` and set to (`remainder` * 100) * 0.6
# - reassign `seconds` to truncated version of `seconds`
# - interpolate components with symbols and return
# CODE

def dms(angle)
  degrees, rem = angle.divmod(1)
  minutes, rem = (rem * 60).divmod(1)
  seconds, rem = (rem * 60).divmod(1)
  minutes = minutes.to_s.rjust(2,"0")
  seconds = seconds.to_s.rjust(2,"0")
  "#{degrees}\xC2\xB0#{minutes}'#{seconds}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# FURTHER EXPLORATIION
# ====================
# additional rules:
# - the degrees should be within the appropriate rang
# - negative degrees are subtracted from 360
# - only remaining degrees are used when total surpasses 360
# EXAMPLES
# dms(400) == %(40°00'00")
# dms(-40) == %(320°00'00")
# dms(-420) == %(300°00'00")
# ALGORITHM
# - given `angle`
# - instantiate `degrees` and set to quotient of integer division by 1
# - if `degrees` is negative, reassign `degrees` to `360 - degrees`
# - if `degrees` is greater than `360`, reassign to modulus of 360
# - instantiate `remainder` and set to remainder of division
# - instantiate `minutes` and set to (`remainder` * 100) * 0.6
# - reassign `remainder` to remainder of division
# - instantiate `seconds` and set to (`remainder` * 100) * 0.6
# - reassign `seconds` to truncated version of `seconds`
# - interpolate components with symbols and return
# CODE

def dms_whole(angle)
  degrees, rem = angle.divmod(1)
  degrees = 360 + degrees if degrees < 0
  degrees = degrees % 360
  minutes, rem = (rem * 60).divmod(1)
  seconds, rem = (rem * 60).divmod(1)
  minutes = minutes.to_s.rjust(2,"0")
  seconds = seconds.to_s.rjust(2,"0")
  "#{degrees}\xC2\xB0#{minutes}'#{seconds}\""
end

puts '-- Further exploration'
p dms_whole(400) == %(40°00'00")
p dms_whole(-40) == %(320°00'00")
p dms_whole(-420) == %(300°00'00")
