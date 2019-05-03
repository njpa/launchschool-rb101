# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and
# return the number of minutes before and after midnight, respectively. Both
# methods should return a value in the range `0..1439`.

# You may not use ruby's `Date` and `Time` methods.

# Examples:

# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# ANSWER
# ======

# PROBLEM
# input: string
# output: integer
# rules:
# - [both methods] input in `'hh:mm'` format
# - [both methods] cannot use `Date` and `Time` methods
# - [before_midnight] return value is number of minutes before midnight
# - [after_midnight] return value is number of minutes after midnight
# - return value should be in range `0..1439`, if it exceeds, return `0`
# EXAMPLE
#  after_midnight('00:00') == 0
#  before_midnight('00:00') == 0
#  after_midnight('12:34') == 754
#  before_midnight('12:34') == 686
#  after_midnight('24:00') == 0
#  before_midnight('24:00') == 0
# DATA STRUCTURES
# nothing fancy
# ALGORITHM
# after_midnight:
# - given `string`
# - [sub-algo] obtain `hours` and `minutes` from `string`
# - instantiate `total` and set equal to `minutes` + (60 * `hours`)
# - return `total`
# before_midnight:
# - given `string`
# - [sub-algo] obtain `hours` and `minutes` from `string`
# - instantiate `total` and set equal to (1440 - (`minutes` + (60 * `hours`)))
# - return `total`
# Sub-algorithm: obtain `hours` and `minutes` from `string`
# - split `string` and store hours in `hours` and minutes in `minutes`
# - reassign `hours` to integer of `hours`
# - reassign `minutes` to integer of `minutes`
# CODE

HOURS_TO_MINS = 60
MINS_IN_DAY = 1440

def after_midnight(string)
  hours, minutes = string.split(':').map(&:to_i)
  total = (hours * HOURS_TO_MINS) + minutes
  total > 1439 ? 0 : total
end

def before_midnight(string)
  hours, minutes = string.split(':').map(&:to_i)
  total = MINS_IN_DAY - ((hours * HOURS_TO_MINS) + minutes)
  total > 1439 ? 0 : total
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('23:59') == 1439
p before_midnight('23:59') == 1
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# FURTHER EXPLORATION
# ===================
# How would these methods change if you were allowed to use the `Date` and
# `Time` classes?

# The `DateTime::parse` class method takes a string as argument and returns
# a `DateTime` object. We can then invoke `DateTime#strftime` on this object
# and get a string return value representing the number of seconds elapsed
# since Unix epoch all the way until today's date an the time provided in the
# original string argument.  We can then instantiate a `baseline` variable
# with the intention of keeping track of the number of seconds elapsed since
# Unix epoch until today's date at `'00:00'`.  The difference of these two
# amounts will represent the number of seconds after midnight.

require 'date'

MINUTES_IN_DAY = 1440
SECONDS_IN_MINUTE = 60

def apres_minuit(string)
  elapsed = DateTime.parse(string).strftime('%s').to_i
  baseline = DateTime.parse('00:00').strftime('%s').to_i
  ((elapsed - baseline) / SECONDS_IN_MINUTE) % MINUTES_IN_DAY
end

def avant_minuit(string)
  minutes = MINUTES_IN_DAY - apres_minuit(string)
  minutes == MINUTES_IN_DAY ? 0 : minutes
end

puts '-- Further exploration'
p apres_minuit('00:00') == 0
p avant_minuit('00:00') == 0
p apres_minuit('12:34') == 754
p avant_minuit('12:34') == 686
p apres_minuit('23:59') == 1439
p avant_minuit('23:59') == 1
p apres_minuit('24:00') == 0
p avant_minuit('24:00') == 0
