# What will the following code print, and why? Don't run the code until you have tried
# to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# ANSWER
# ======
# In the third line of the code, the block provided in the `each` invocation
# will append the current element from the `array1` array to the `array2`
# object.  The elements in `array1` and `array2` will be the same objects
# in physical memory.  Once we mutate the elements, as is done in the
# fourth line of the code with the `String#upcase!` invocation, the change
# will also impact the elements in `array2`.

# puts array2
# => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]

# Further Exploration
# -------------------
# How can this feature of ruby get you in trouble? How can you avoid it?

# Answer
# ------
# We could avoid using destructive methods whenever possible.  If we need to
# change an array, then we can reassign that variable to a new array referencing
# the return value of a `#map` invocation on the caller:

puts '-------'
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1 = array1.map do |value|
  value.start_with?('C', 'S') ? value.upcase : value
end
puts array2

array1.each { |x| puts x.object_id }
array2.each { |x| puts x.object_id }
