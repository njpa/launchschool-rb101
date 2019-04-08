# Write a method that returns `true` if its integer argument is palindromic,
# `false` otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# ANSWER
# ======
# We'll assume that the method does not have to validate input and check
# for integers.

def palindromic_number?(num)
  num_string = num.to_s
  num_string == num_string.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further Exploration
# -------------------
# Suppose your number begins with one or more 0s. Will your method still
# work? Why or why not? Is there any way to address this?c

# ANSWER
# ------
# The method will not work since the `Integer#to_s` method will not recognize
# preceding zeroes in an integer in its return value.
# Assuming that the only character that can precede a 'valid' Integer is a
# `'0'`, we can obtain the length of the

def palindromic_number?(num)
  p num
  num_string = num.to_s
  p num_string
  num_string == num_string.reverse
end

puts '--'
p palindromic_number?(051) == true
