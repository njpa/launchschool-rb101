=begin

Write a method that will take an array of numbers and return the number of
primes in the array.

Example:
  count_primes([1, 2, 3, 4,]) # => 2
  count_primes([4, 6, 8, 10]) # => 0

PEDAC
=====
arr -> int
- int is number of primes in arr
- method
- rely on previous method(s)
no structs
algo:
- given `numbers`
- instantiate `primes` and set to 0
- for each `number` in `numbers`
  - increment `primes` by 1 if `number` is prime
- return `primes`

TIME
====
14:10 started pedac
14:12 started coding
14:14 arrived at solution
14:16 refactored
=end

def count_primes(numbers)
  primes = 0
  counter = 0

  loop do
    break if counter == numbers.size

    primes += 1 if prime?(numbers[counter])
    counter += 1
  end

  primes
end

def prime?(number)
  return false if number <= 1

  2.upto(number - 1) { |num| return false if number % num == 0 }
  true
end

p count_primes([1, 2, 3, 4,]) == 2
p count_primes([4, 6, 8, 10]) == 0

# ALTERNATIVE

def count_primes_alt(numbers)
  primes = 0

  loop do
    break if numbers.size == 0

		number = numbers.pop
    primes += 1 if prime?(number)
  end

	primes
end

puts '-- Alternative'
p count_primes_alt([1, 2, 3, 4,]) == 2
p count_primes_alt([4, 6, 8, 10]) == 0

# REFACTOR

def count_primes_re(nums)
  nums.count { |num| prime?(num) }
end

puts '-- Refactored  '
p count_primes_re([1, 2, 3, 4,]) == 2
p count_primes_re([4, 6, 8, 10]) == 0
