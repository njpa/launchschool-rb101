# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

freq = {}

statement.chars.each do |char|
  unless char == " "
    freq[char] == nil ? freq[char] = 1 : freq[char] += 1
  end
end

p freq
