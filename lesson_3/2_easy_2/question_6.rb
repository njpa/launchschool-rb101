# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# We can use the 'shovel operator' to append the element to the end of the
# array.  We can also invoke `Array#push` on `flintstones` passing in the
# String `'Dino'`.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push "Dino"
p flintstones
