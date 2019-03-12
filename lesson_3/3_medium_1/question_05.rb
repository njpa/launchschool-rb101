# Alyssa asked Ben to write up a basic implementation of a Fibonacci
# calculator, A user passes in two numbers, and the calculator will keep
# computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the
# code?

LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# How would you fix this so that it works?

# ANSWER
# The method level scope in which we attempt to access `limit`, cannot reach to
# the outer scope in which `limit` was instantiated.  This will raise a
# `NameError`. We could instantiate `limit` as a constant.  In ruby, constant variables are
# accessible within the method-level scope.

# We can also refactor the method so that it takes in an additional argument
# referencing the limit.

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"



