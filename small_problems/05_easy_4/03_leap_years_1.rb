# In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisible by
# 100. If the year is evenly divisible by 100, then it is not a leap year
# unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method
# that takes any year greater than 0 as input, and returns true if the year
# is a leap year, or false if it is not a leap year.

# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# ANSWER
# ======
# Problem
# input: integer
# output: boolean
# rules:
#  - leap year is a year evenly divisible by `4`
#  - if year is evenly divisible by `4` and `100`, it is not a leap year
#    example:  100, 200, 300 are not leap years
#  - if the year is evenly divisible by `400`, the previous rule exempted
#    example: 400, 800, 1200 are leap years
#  - these rules work for any year greater than `0`
#  - we'll assume entry validation is not required
#  - method returns `true` if provided integer represents leap year,
#    `false` if it doesn't
# Examples:
#  leap_year?(2016) == true
#  leap_year?(2015) == false
#  leap_year?(2100) == false
#  leap_year?(2400) == true
#  leap_year?(240000) == true
#  leap_year?(240001) == false
#  leap_year?(2000) == true
#  leap_year?(1900) == false
#  leap_year?(1752) == true
#  leap_year?(1700) == false
#  leap_year?(1) == false
#  leap_year?(100) == false
#  leap_year?(400) == true
# Data structures: nothing fancy
# Algorithm:
#  - provided the integer `year`,
#  - obtain remainder of `year` / `4` store in `rem4`
#  - obtain remainder of `year` / `100`, store in `rem100`
#  - obtain remainder of `year` / `400`, store in `rem400`
#  - if `rem4` is uneven
#      return false
#    else,
#      if `rem100` is even and `rem400` is even
#        return true
#      elsif `rem100` is even and `rem400` is false
#        return false
# Code:

def leap_year?(year)
  leap_year = false
  if year % 4 == 0
    if year % 100 == 0 && year % 400 == 0
      leap_year = true
    elsif year % 100 == 0 && year % 400 != 0
      leap_year = false
    else
      leap_year = true
    end
  end
  leap_year
end

puts '-- classic `if`/`else` execution control'
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# SUGGESTION
# ==========
# By spending some more time analyzing the logic of the rules, we can simplify
# them to the following three rules:
#   If year is evenly divisible by 400, we can assume it's a leap year
#   else
#     if year is evenly divisible by 100, we can assume it's not a leap year
#     else
#       if year is evenly divisible by 4, it's a leap year

def leap?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

puts '-- classic `if`/`else` optimized'
p leap?(2016) == true
p leap?(2015) == false
p leap?(2100) == false
p leap?(2400) == true
p leap?(240000) == true
p leap?(240001) == false
p leap?(2000) == true
p leap?(1900) == false
p leap?(1752) == true
p leap?(1700) == false
p leap?(1) == false
p leap?(100) == false
p leap?(400) == true

# Here is the same logic, but using nested ternary expressions
def leap_one_liner?(year)
  year % 400 == 0 ? true : (year % 100 ? false : year % 4)
end

puts '-- nested ternary expressions'
p leap?(2016) == true
p leap?(2015) == false
p leap?(2100) == false
p leap?(2400) == true
p leap?(240000) == true
p leap?(240001) == false
p leap?(2000) == true
p leap?(1900) == false
p leap?(1752) == true
p leap?(1700) == false
p leap?(1) == false
p leap?(100) == false
p leap?(400) == true

# Further Exploration
# -------------------
# The order in which you perform tests for a leap year calculation is
# important. For what years will `leap_year?` fail if you rewrite it as:

def leap_year_exploration?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# Can you rewrite `leap_year?` to perform its tests in the opposite order of
# the above solution? That is, test whether the year is divisible by 4 first,
# then, if necessary, test whether it is divisible by 100, and finally, if
# necessary, test whether it is divisible by 400. Is this solution simpler
# or more complex than the original solution?

# ANSWER
# ------
# The reordered `if`/`else` statement considers that `year` being evenly
# divisble by `100` and `year` being evenly divisible by `400` are mutally
# exclusive.  The interesting condition for which we need to test, and for
# which the code does not check, is whether a `year` is both evenly divisible
# by `100` and evenly divisible by `400`, so that we can conclude that the
# year is a leap year.  In this `if`/`else` statement, providing a year such as
# `800`- which is both divible by `400` as well as `100`- will incorrectly
# give us a return value of `false`.

puts '-- further exploration, fails when year is evenly divisible by `400`'
p leap_year_exploration?(2016) == true
p leap_year_exploration?(2015) == false
p leap_year_exploration?(2100) == false
p leap_year_exploration?(2400) == true
p leap_year_exploration?(240000) == true
p leap_year_exploration?(240001) == false
p leap_year_exploration?(2000) == true
p leap_year_exploration?(1900) == false
p leap_year_exploration?(1752) == true
p leap_year_exploration?(1700) == false
p leap_year_exploration?(1) == false
p leap_year_exploration?(100) == false
# Exa
# Exa
# Exa
p leap_year_exploration?(400) == true
