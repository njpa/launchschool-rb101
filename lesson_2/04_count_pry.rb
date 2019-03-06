require "pry"

counter = 0

loop do
  counter += 1
  binding.pry
  break if counter == 5
end
loop do

puts "before pry"
binding.pry
puts "after pry"

# NOTES
# =====
# to exit `pry` completely, enter `exit-program`
# the `system 'clear'` command also works in `pry`
# to continue the execution of the program, enter `exit` or press `Ctrl + D`
