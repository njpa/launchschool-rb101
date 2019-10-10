=begin

Write a method that will determine whether an integer is a prime.
Don't use the prime class.

Examples:
  is_prime(3) # => true
  is_prime(4) # => false

PEDAC
=====
int -> bool
- method
- return value indicates if argument is a prime number
- can't use prime class
- prime number: a whole number, greater than 1, divisible only by 1
  and itself - basically, if a number is divisible by any number
  less than itself and greater than 1, it is not a prime
- questions:
  - need to validate input? no
  - assume argument is always greater than 1? yes
algo:
- given `number`
- instantiate `prime` and set to `true`
- instantiate `count` and set to `2`
- from `count` to `number` (non-inclusive)
  if modulo `number` of `count` is `0`, then set `prime` to `false`
- return `prime`

TIME
====
started pedac at 22:19
stopped pedac at 22:24, started coding
arrived at working solution at 22:27, started refactoring
finished refactpring at 22:29
finished second refactoring at 22:31

=end

def prime?(number)
  prime = true
  count = 2

  loop do
    break if count == number

    prime = false if number % count == 0
    count += 1
  end

  prime
end

p prime?(3) == true
p prime?(4) == false

# refactor

def prime_re?(number)
  count = 2

  loop do
    break if count == number

    return false if number % count == 0

    count += 1
  end

  true
end

puts '-- refactor'
p prime_re?(3) == true
p prime_re?(4) == false

# concise version

def prime_rere?(number)
  return false if number <= 1

  2.upto(number - 1) do |num|
    return false if number % num == 0
  end
  true
end

puts '-- further refactor'
p prime_rere?(1) == false
p prime_rere?(3) == true
p prime_rere?(4) == false
