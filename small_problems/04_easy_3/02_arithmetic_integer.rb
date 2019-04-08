# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry
# about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# ANSWER
# ======
# Algorithm:
# 1. obtain first number, store in `num1`
# 2. obtain second number, store in `num2`
# 3. output interpolated string with `num1`, `num2`, result of sum of both
# 4. output interpolated string with `num1`, `num2`, result of subtraction
# 5. output interpolated string with `num1`, `num2`, product of both
# 6. output interpolated string with `num1`, `num2`, division of both
# 7. output interpolated string with `num1`, `num2`, and `num1` ^ `num2`

def prompt(message)
  puts "==> #{message}"
end

prompt "Enter the first number:"
num1 = gets.chomp.to_i

prompt "Enter the second number:"
num2 = gets.chomp.to_i

prompt "#{num1} + #{num2} = #{num1 + num2}"
prompt "#{num1} - #{num2} = #{num1 - num2}"
prompt "#{num1} * #{num2} = #{num1 * num2}"
prompt "#{num1} / #{num2} = #{num1 / num2}"
prompt "#{num1} ** #{num2} = #{num1 ** num2}"
