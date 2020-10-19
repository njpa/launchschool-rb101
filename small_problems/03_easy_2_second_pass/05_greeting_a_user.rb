# PROBLEM
# Write a program that will ask for user's name.
# The program will then greet the user. If the
# user writes "name!" then the computer yells back to the user.
# mental model:
# assumptions:

# EXAMPLES
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE:
# STARTED:  14:30
# DURATION:

puts ">> What is your name?"
name = gets.chomp

if name[-1] == "!"
  puts ">> HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts ">> Hello #{name}."
end

puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:
