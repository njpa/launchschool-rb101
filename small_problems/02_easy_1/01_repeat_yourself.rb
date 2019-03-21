# PROBLEM
# =======
# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# => Hello
# => Hello
# => Hello

# ANSWER
# ======
# Here is an implementation using only loops, counters and breaks:

def repeat(str, num)
  counter = 0

  loop do
    break if counter == num

    puts str
    counter += 1
  end
end

repeat('Hello', 3)
