# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# Approach 1
# ----------
sum = 0
keys = ages.keys
counter = 0

loop do
  break if counter >= keys.length

  sum += ages[keys[counter]]
  counter += 1
end

p sum

# Approach 2
# ----------
sum = 0

ages.each { |key, val| sum += val }

p sum

# Approach 3
# ----------
p ages.values.reduce(:+)

# Approach 4
# ----------
p ages.values.sum
