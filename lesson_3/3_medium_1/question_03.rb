# Alan wrote the following method, which was intended to show all of the
# factors of the input number:

def factors(number)
  divisor = number
  factors = []
  #begin
	while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  #end until divisor == 1
	end
  factors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# `begin`/`end`/`until`? Note that we're not looking to find the factors for
# 0 or negative numbers, but we just want to handle it gracefully instead of
# raising an exception or going into an infinite loop.

p factors 10

# ANSWER
# The `begin`/`end` loop allows for the execution of the body once before
# checking the break condition.  It will therefore attempt to evaluate
# `number / divisor` if we provide the method invocation with a `0` as
# argument. Ruby will then raise a `ZeroDivisionError` exception.
# We could use a `while` loop providing it with a condition `divisor > 0`.
# This would guarantee that the loop is not executed if `divisor` is equal
# to `0`.

# BONUS 1
# What is the purpose of the `number % divisor == 0` ?

# ANSWER BONUS 1
# This conditional statement checks that `number` is divisible by `divisor`.
# If the remainder of that division is equal to `0`, we assume that `divisor`
# is a factor or `number`.
# Providing this conditional statement ensures that only factors of `number`
# are pushed into the `factors` array.

# BONUS 2
# What is the purpose of the second-to-last line (`line 8`) in the method
# (the `factors` before the method's `end`)?

# ANSWER BONUS 2
# Without it, the last evaluated statement in the method would be the `while`
# loop, which returns a `nil` value. Since there is no explicit `return` in the
# method, the value of this last evaluation would be the return value of the
# method.
# By adding `factors` before the `end` of the method, we ensure `factors` is
# returned when the method is invoked, rather than `nil`.
