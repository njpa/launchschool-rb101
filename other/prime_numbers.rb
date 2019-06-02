=begin
rules
- number is divisible by 1
- number is divisible by itself
- number is not divisible by any number between 1 and itself
- number is greater than 1
exaples:
  is_prime(5) == true
  is_prime(6) == false
algorithm:
- given `num`
- instantiate `numbers` and set to array starting at 2 and ending
  at `num`
- instantiate `prime` and set to `true`
- while `count` is less than or equal to `num`
  if `number` divided by `count` has a remainder of 0
    set `prime` to `false`
=end

def is_prime?(number)
  return false if number == 1
  prime = true

  (2...number).each do |num|
    prime = false if number % num == 0
  end

  prime
end

p is_prime?(1) == false
p is_prime?(5) == true
p is_prime?(6) == false

# write a method that will take an array of integers and return
# those that are prime

def select_primes(integers)
  integers.select { |integer| is_prime?(integer) }
end

puts "-- second part"
p select_primes([1,2,3,4,5,6,7,8,9]) == [2,3,5,7]

# Write a method that takes an array of integers and returns
# the number of primes in an array

def how_many_primes(integers)
  number_primes = 0

  count = 0
  loop do
    break if count >= integers.size

    number_primes += 1 if is_prime?(integers[count])

    count += 1
  end

  number_primes
end

puts "-- third part"
p how_many_primes([1,2,3,4,5,6,7,8,9]) == 4

