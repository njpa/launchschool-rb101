# Write a method that takes a positive integer as an argument and returns
# that number with its digits reversed. Examples:

# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1

# Don't worry about arguments with leading zeros - Ruby sees those as octal
# numbers, which will cause confusing results. For similar reasons, the
# return value for our fourth example doesn't have any leading zeros.

# ANSWER
# ======
# positive integer -> integer
# - return integer is argument with digits reversed
# - assume argument is positive
# - don't worry about argument with leading zeros
# - no leading zeros in return value
# questions: can we use `Array#reverse`? We'll assume we can.
# data structures: array to store digits?
# algorithm:
# - given `number`
# - instantiate `reversed` and set to `[]`
# - instantiate `digits` and store digits of `number`
# - instantiate `leading?` and set to `true`
# - for each `digit` in `digits`
#     - if `digit` == `0` and `leading?` is `true`
#     - else
#       - append `digit` to `reversed`
#       - reassign `leading?` to `false`
# - return `reversed`

def reversed_number(number)
  reversed = []
  leading = true

  number.digits.each do |digit|
    unless leading && digit == 0
      leading = false
      reversed.push(digit)
    end
  end

  reversed.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# ALTERNATIVE
# -----------
# The `String#to_i` method ignores leading zeros in the argument.

def reversed_number_re(num)
  num.to_s.reverse.to_i
end

puts '-- Alternative'
p reversed_number_re(12345) == 54321
p reversed_number_re(12213) == 31221
p reversed_number_re(456) == 654
p reversed_number_re(12000) == 21 # No leading zeros in return value!
p reversed_number_re(12003) == 30021
p reversed_number_re(1) == 1

