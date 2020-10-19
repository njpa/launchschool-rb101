=begin
EXERCISE 9 (FIBONACCI - PROCEDURAL)
# F(n) = F(n - 1) + F(n - 2) where n > 2

# given `nth`
# if it is less than or equal to two, return 1
# else
#   initialize `fibonacci_number` and set to `2`
#   initialize `count` and set to `3`
#   iterate until `count` > `nth`
#      update `fibonnaci_number` to
#       the sum of (`fibonacci_number` - 1) + (`fibonacci_number` - 1)
#      update `count` by 1
# return fibonnaci_number
=end

def fibonacci(nth)
  return 1 if nth < 2

  nums = [1, 1]
  (2...nth).each { |curr| nums << nums[curr - 1] + nums[curr - 2] }
  nums.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
