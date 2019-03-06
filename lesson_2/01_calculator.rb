# WALK-THROUGH
# ============
# Build a command line calculator program that does the following:
# - asks for two numbers
# - asks for the type of operation to perform: add, subtract, 
#   multiply or divide
# - displays the result
# Use the `Kernel.gets()` method to retrieve user input, and use 
# `Kernel.puts()` method to display output. Remember that `Kernel.gets()`
# includes the newline, so you have to call `chomp()` to remove it: 
# `Kernel.gets().chomp()`.

# EXERCISE
# ========
# We start off with some pseudocode:
# ask for two numbers
# ask user for type of operation
# perform operation on numbers
# output the result of the operation

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("Please enter the first number: ")
number_1 = Kernel.gets().chomp()

Kernel.puts("Please enter the second number: ")
number_2 = Kernel.gets().chomp()

Kernel.puts("Please enter the operation to perform on the numbers.")
Kernel.puts("(1) to add, (2) to subtract, (3) to multiply, (4) to divide: ")
operation = Kernel.gets().chomp()

result = 
  case operation 
  when "1"   then number_1.to_i() + number_2.to_i()
  when "2"   then number_1.to_i() - number_2.to_i()
  when "3"   then number_1.to_i() * number_2.to_i()
  when "4"   then number_1.to_f() / number_2.to_f()
  end

Kernel.puts("The result is #{result}")

# N.B.: the `gets` and `puts` method are in a module called `Kernel`.
# N.B.: all ruby objects have the `inspect` method
# N.B.: `if` statements do not form a block, so any variables that are 
#       initialized in an `if` statement will be accessible from the outer
#       scope.
