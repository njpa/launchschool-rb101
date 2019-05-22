require 'pry'
require 'pry-byebug'

a = 0
b = 0

loop do
  a += 1
  b += 1
  binding.pry

  break if b >= 3
end
