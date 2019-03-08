# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either `Array#concat` or `Array#push` to add Dino to the
# family.
# How can we add multiple items to our array? (Dino and Hoppy)
#
# ANSWER
# We can invoke `#push` on the array and pass in multiple arguments since
# the method allows for this.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

# We could also simply chain two method calls in a row.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")
p flintstones

# We could also invoke `Array#concat` and actually pass in an array containing
# both strings as the argument.  The method will modify the array by adding
# all elements contained in the array into the caller array.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(["Dino", "Hoppy"])
p flintstones
