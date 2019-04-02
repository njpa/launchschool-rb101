# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the
# user.

# Examples
# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# ANSWER
# input: string (name)
# output: string (name)
# requirements:
# - if name preceded by `'!'`, shout out
# data structures: converting name to array, to see if last element is == `'!'`
# algorithm
# - obtain name and store in `name`
# - check if last element in array of letters of `name` is equal to `'!'`
#   if so, create uppercase version of name without `'!'` character
#     should out hi
#   if not, say hi

puts "What is your name?"
name = gets.chomp

if name.chars.pop == '!'
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
