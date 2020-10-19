=begin
EXERCISE 10 (FIBONACCI - LAST DIGIT)
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.
=end

def fibonacci_last_mem(nth)
  return 1 if nth < 2
  nums = [1,1]
  (2...nth).each do |count|
    nums << nums[count - 1] + nums[count - 2]
  end
  nums.last.digits.reverse.last
end

def fibonacci_last(nth)
  last, first = [1, 1]
  (3..nth).each do |_|
    last, first = last_digit(first), last_digit(first) + last_digit(last)
  end
  first.digits.reverse.last
end

def last_digit(number)
  number.digits.reverse.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)

p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
