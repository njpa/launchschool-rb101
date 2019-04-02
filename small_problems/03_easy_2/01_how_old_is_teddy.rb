# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.
# Example Output

# => Teddy is 69 years old!

# ANSWER

age = rand(20..200)
puts "Teddy is #{age} years old!"

# Further Exploration
# Modify this program to ask for a name, and then print the age for that
# person. For an extra challenge, use "Teddy" as the name if no name is entered.

name = ""

loop do
  puts "Give me a name: "
  name = gets.chomp
  break unless name == ""
end

age = rand(20..200)

puts "#{name} is #{age} years old!"
