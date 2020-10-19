nums = []
puts "==> Enter the 1st number:"
first = gets.chomp.to_i
nums << first

puts "==> Enter the 2nd number:"
second = gets.chomp.to_i
nums << second

puts "==> Enter the 3rd number:"
third = gets.chomp.to_i
nums << third

puts "==> Enter the 4th number:"
fourth = gets.chomp.to_i
nums << fourth

puts "==> Enter the 5th number:"
fifth = gets.chomp.to_i
nums << fifth

puts "==> Enter the last number:"
last = gets.chomp.to_i

appears = nums.include?(last) ? "appears" : "does not appear"

puts "The number #{last} #{appears} in #{nums}."
