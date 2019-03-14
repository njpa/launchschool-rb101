# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# ANSWER
# When we assign `informal_greeting` to `greetings[:a]`, we are setting
# it to reference the same object reference by the value of the `:a` key
# in the `greetings` hash.
# If we mutate that value by invoking `String#<<` on it, we will also
# change the original value referenced by the `:a` key in the `greetings` hash.
# `puts greetings` will therefore output the original hash with the modified
# value (in the 'old notation'):

# => {:a=>'hi there'}
