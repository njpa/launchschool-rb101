# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

hsh = {}

flintstones.each_with_index { |item, index| hsh[item] = index }

p hsh
# => {"Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4 ....
