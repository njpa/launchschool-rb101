# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Answer
# We can use the percent strings literal.  The `%w` percent string can
# create an array of strings.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
