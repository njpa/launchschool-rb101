# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# Approach 1
# ----------
def min(family)
  ages = family.values
  min = ages[0]
  counter = 1
  loop do
    break if counter == ages.length
    min = ages[counter] if min > ages[counter]
    counter += 1
  end
  min
end

p min(ages) # => 10

# Approach 2
# ----------
def min(family)
  family.values.min
end

p min(ages) # => 10
