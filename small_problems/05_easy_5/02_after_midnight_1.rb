# The time of day can be represented as the number of minutes before or
# after midnight. If the number of minutes is positive, the time is after
# midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's `Date` and `Time` classes.

# Examples:
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.

# ANSWER
# ======

# PROBLEM
# input: integer
# output: string
# rules:
# - number can be negative
# - returns time in `'hh:mm'` format, with 0-padding required
# - can accept `0`
# - if number of hours bigger than `24`, count onwards from `'00:00'`
# EXAMPLE
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# DATA STRUCTURES
# probably nothing fancy
# ALGORITHM
# - given `minutes_after_midnight`
# - if `minutes_after_midnight` is positive
#   - [sub-algo] obtain `hours` and `minutes` after midnight
#   else if negative
#   - [sub-algo] obtain `hours` and `minutes` before midnight
#   else
#   - return `'00:00'`
# - instantiate `minutes_formatted` and set to `'mm'` version of
#   `minutes` with zero-padding of two characters
# - instantiate `hours_formatted` and set to `'hh'` version of
#   `hours` with zero-padding of two characters
# - instantiate `time` and set to interpolation of
#   `hours_formatted:minutes_formatted`
# sub-algorithm [obtain `hours` and `minutes` after midnight]:
# - divide `minutes_after_midnight` by `60`, store remainder in `minutes`,
#   and store quotient in `hours`
# - reassign `hours` to modulus of `60` and `24`
# sub-algorithm [obtain `hours` and `minutes` before midnight]:
# - divide absolute value of `minutes_after_midnight` by `60`,
#   store (60-remainder) in `minutes`, quotient in `hours`
# - reassign `hours` to modulus of `hours` and `24`
# - reassign `hours` to `23-hours`
# CODE

def time_of_day(total_minutes)
  hours, minutes = total_minutes.abs.divmod(60)
  hours = hours % 24
  if total_minutes < 0
    minutes = 60 - minutes
    hours = 23 - hours
  end
  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# ALTERNATIVE
# ===========
# We can also 'shave' off the excess days from the get go and reassign
# `total_minutes` to the remaining hours and minutes.
# For extra clarity, we can also rely on the `#format` method.

def times_of_day(total_minutes)
  total_minutes =  total_minutes % 1440
  hours, minutes = total_minutes.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p '--'
p times_of_day(0) == "00:00"
p times_of_day(-3) == "23:57"
p times_of_day(35) == "00:35"
p times_of_day(-1437) == "00:03"
p times_of_day(3000) == "02:00"
p times_of_day(800) == "13:20"
p times_of_day(-4231) == "01:29"

# FURTHER EXPLORATION
# ===================
# How would you approach this problem if you were allowed to use ruby's `Date`
# and `Time` classes? Suppose you also needed to consider the day of week?
# (Assume that `delta_minutes` is the number of minutes before or after
# midnight between Saturday and Sunday; in such a method, a delta_minutes
# value of `-4231` would need to produce a return value of
# `'Thursday 01:29'`.)

# ANSWER
# ======
# The `Time::at` class method takes `number_of_seconds` (an `Integer`)
# as argument and returns a `Time` object representing the time at
# `number_of_seconds` after unix epoch.
# The `Time#strftime` method takes in a string configuring the output format
# and returns a formatted string representing the time of the `Time` caller.
# The `'%w'` flag formats the string so that it includes an integer
# representing the day of the week.  If we assume that '4', which is the
# day of the week of a `Time` object instantiated `::at` `0` seconds after
# unix epoch, is equal to Sunday, we can meet the requirements.

MINS_TO_SECS = 60
WEEKDAYS = {'0'=> 'Wednesday',
            '1'=> 'Thursday',
            '2'=> 'Friday',
            '3'=> 'Saturday',
            '4'=> 'Sunday',
            '5'=> 'Monday',
            '6'=> 'Tuesday'}

def time_of_the_day(minutes)
  day, time = Time.at(minutes * MINS_TO_SECS).strftime("%w %R").split(' ')
  "#{WEEKDAYS[day]} #{time}"
end

p '-- Further explorations'
p time_of_the_day(0) == "Sunday 00:00"
p time_of_the_day(-3) == "Saturday 23:57"
p time_of_the_day(35) == "Sunday 00:35"
p time_of_the_day(-1437) == "Saturday 00:03"
p time_of_the_day(3000) == "Tuesday 02:00"
p time_of_the_day(800) == "Sunday 13:20"
p time_of_the_day(-4231) == "Thursday 01:29"
