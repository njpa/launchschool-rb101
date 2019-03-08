# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

# Answer
# ------
# We can invoke the destructive `Array#flatten!` method on `flintstones`.  This
# will modify the object and turn it into a one-dimensional array.

flintstones.flatten!
p flintstones
