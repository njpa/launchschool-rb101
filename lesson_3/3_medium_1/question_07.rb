# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# ANSWER
# `34` is output.  Invoking `mess_with_it` passing it `answer` as argument
# does not mutate `answer` since the method performs some reassignment
# (numbers are immutable in ruby).
