# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# Examples:

# show_multiplicative_average([3, 5])
# The result is 7.500

# show_multiplicative_average([6])
# The result is 6.000

# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# ANSWER
# array of integers -> float
# - return float is rounded to 3 decimal places
# - array is non-empty
# - return float is product of integers in array, divided by number of elements
# - the method prints the result
# algorithm:
# - given `numbers`
# - reduce `numbers` to product and store in `product`
# - perform float division on `product` by size of `numbers` and store in `avg`
# - round `avg` to 3 decimal places
# - output interpolated string with `avg`

def show_multiplicative_average(numbers)
  product = numbers.reduce(:*)
  mult_avg = product / numbers.size.to_f
  puts "The result is #{mult_avg.round(3)}"
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# FURTHER EXPLORATION
# ===================
# In the solution below, what happens if we omit the `#to_f`?

def show_multiplicative_average_further(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts format('%.3f', average)
end

# ANSWER
# ======
# Omitting the `#to_f` invocation on `product` keeps `product` as an
# `Integer` object.  Although this would have no impact on the calculation
# of the product of the numbers, once we invoke `#/` on `product` we deviate
# from the problem's requirements.  With `product` being an `Integer`, Ruby
# inferentially invokes `Integer#/` on it, thereby giving us an `Integer`
# object as return value.  If we were to invoke `#/` on `product` as a
# `Float`, then Ruby would inferentially invoke `Float#/` on it, thereby
# returning a `Float` value.
