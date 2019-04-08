# Using the `multiply` method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is
# the result of multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

# ANSWER
# ======

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64

# Further Exploration
# -------------------
# What if we wanted generalize this method to a "power to the n" type method:
# cubed, to the 4th power, to the 5th, etc. How would we go about doing so
# while still using the `multiply` method?

# For this problem, we'll assume that the power can only be a whole number.

def divide(num1, num2)
  num1 / num2
end

def power(num, pow)
  if pow < 0
    res = divide(1, num.to_f)
    (pow.abs - 1).times { res /= num.to_f }
  elsif pow == 0
    res = 1
  elsif pow == 1
    res = num
  else
    res = multiply(num, num)
    (pow - 2).times { res *= num }
  end
  res
end

puts '---------'
p power(2, 0) == 1
p power(2, 1) == 2
p power(3, 3) == 27
p power(8, -1) == 0.125
p power(5, -3) == 0.008
