=begin

Write a method that will take an array of numbers and only return those that
are prime.

Examples:
  select_primes([1, 2, 3, 4]) = [2, 3]
  select_primes([4, 6, 8, 10]) = []

PEDAC
=====
array -> array
- array of numbers, returns those that are prime
- no primes: empty array
questions:
- can I use the is_prime? method? Yes
- can I use the `#select` method? Yes
- return same array or new one? new one
structs: new array for return value
algo:
- given `numbers`
- instantiate `primes` and set to `[]`
- for each `number` in `numbers`
  - push into `primes` if it is prime
- return `primes`

TIME
====
started pedac 13:31
started coding 13:34
arrived working solution 13:38
refactored 13:40

=end

def select_primes(numbers)
  primes = []

  counter = 0
  loop do
    break if counter == numbers.size

    primes << numbers[counter] if prime?(numbers[counter])
    counter += 1
  end

  primes
end

def prime?(number)
  return false if number <= 1

  2.upto(number - 1) { |num| return false if number % num == 0 }
  true
end

p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10]) == []

# REFACTORED

def select_primes_re(numbers)
  numbers.select { |num| prime?(num) }
end

puts '-- refactor'
p select_primes_re([1, 2, 3, 4]) == [2, 3]
p select_primes_re([4, 6, 8, 10]) == []
