# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name
# and Barney's number

# Answer
# ------
# We invoke the `Hash#select!` method on `flintstones` passing in a block with
# two block parameters (referencing the current key and value in the hash) and
# a block body which evaluates to `true` if the current key reference is equal
# to the String `'Barney'`.  This destructive method will mutate the object
# by iterating over it and removing all the key/value pairs for which the block
# body evaluates to `false`.

flintstones.select! { |key, _val| key == "Barney" }
p flintstones

# Correction!
# ===========
# The problem requirement's output is an Array object and not a Hash object!
# The `Hash#assoc` method returns the desired output and simply returns in a
# two-element array the key/value pair for which the key matches the argument
# provided in the method call.

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }
barney = flintstones.assoc("Barney")
p barney
