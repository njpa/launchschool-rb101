# PROBLEM
# =======
# Assume you have the following code:

require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)

# What will each of the 4 puts statements print?

# ANSWER
# ======
# Invoking the `Date::new` class method will create an instance of the `Date`
# class.  This object will have the year, month and date set according to the
# arguments supplied in the invocation.
# Outputting the date object with `#puts` will print out a string format of the
# object, in 'yyyy-mm-dd' format.

puts Date.new  # => -4712-01-01
puts Date.new(2016)  # => 2016-01-01
puts Date.new(2016, 5) # => 2016-05-01
puts Date.new(2016, 5, 13) # => 2016-05-13
