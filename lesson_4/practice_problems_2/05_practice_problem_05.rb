# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

# Approach 1
# ----------
counter = 0
index = 0

loop do
  break if counter == flintstones.length

  index = counter if flintstones[counter].slice(0,2) == "Be"
  counter += 1
end

p index

# Approach 2
# ----------
index = 0
flintstones.each_with_index do |member, current_index|
  index = current_index if member.slice(0,2) == "Be"
end

p index

# Approach 3
# ----------
p flintstones.index { |member| member[0,2] == "Be" }
